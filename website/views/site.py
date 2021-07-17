from website.models.base_page import BasePage
from website.selectors.content_objects import get_content_object_trees
from website.views.pages import ContentObjectBaseSerializer, PageSerializer, serialize_item
from rest_framework import generics, serializers
from utils.serializers import DBObjectSerializer
from website.models import SiteModel
from rest_framework.fields import empty

class SiteSerializer(PageSerializer):
    """Serializer for rendering Site."""

    class Meta:
        model = SiteModel
        fields = ['root_url', 'api_root_url', 'root_page', 'banner_content_sv', 'footer_content_sv', 'banner_content_en', 'footer_content_en']
        depth = 1
        nested_serialization = {
            'root_page': {
                'fields': []
            }
        }

    CONTENT_TREE_FIELDS = ['banner_content_sv', 'footer_content_sv', 'banner_content_en', 'footer_content_en']

    banner_content_sv = serializers.SerializerMethodField()
    footer_content_sv = serializers.SerializerMethodField()
    banner_content_en = serializers.SerializerMethodField()
    footer_content_en = serializers.SerializerMethodField()

    # Adapted from FullPageSerializer
    def __init__(self, instance=None, data=empty,**kwargs):
        if data is not empty:
            self.content_serializers = {}
            for field in self.CONTENT_TREE_FIELDS:
                tmp = data.get(field,{})
                if tmp != {}:
                    self.content_serializers[field] = ContentObjectBaseSerializer(data=tmp)

        #for field in self.CONTENT_TREE_FIELDS: #Doesn't work for some weird reason...
        #    print(field)
        #    setattr(self, "get_"+field, lambda obj: serialize_item(get_content_object_trees([getattr(obj, field)])[0], self.context) if getattr(obj, field) else None)
        
        super().__init__(instance=instance,data=data,**kwargs)


        

    # TODO: get_content_object_trees is kinda slow, and we could probablt be faster by only calling it once for all CONTENT_TREE_FIELDS.
    def get_banner_content_sv(self, obj):
        return serialize_item(get_content_object_trees([obj.banner_content_sv])[0], self.context) if obj.banner_content_sv else None
    def get_footer_content_sv(self, obj):
        return serialize_item(get_content_object_trees([obj.footer_content_sv])[0], self.context) if obj.banner_content_sv else None
    def get_banner_content_en(self, obj):
        return serialize_item(get_content_object_trees([obj.banner_content_en])[0], self.context) if obj.footer_content_en else None
    def get_footer_content_en(self, obj):
        return serialize_item(get_content_object_trees([obj.footer_content_en])[0], self.context) if obj.footer_content_en else None
    
    def is_valid(self, raise_exception=False):
        super().is_valid(raise_exception=raise_exception)
        for field in self.CONTENT_TREE_FIELDS:
            if field in self.content_serializers.keys():
                self.content_serializers[field].is_valid()
                if not (len(self.content_serializers[field].errors) == 1 and "containing_page" in self.content_serializers[field].errors):
                    self.content_serializers[field].errors.pop("containing_page")
                    self._errors = {**self.errors, **self.content_serializers[field].errors}
        
        return (len(self.errors) == 0)


    def save(self ,**kwargs):
        super().save()
        for field in self.CONTENT_TREE_FIELDS:
            if hasattr(self,field):
                data = self.initial_data[field]
                # We actually don't have a containing page, but since this needs to be set, we use the frontpage.
                # TODO: This does overwrite the frontpage when the site singleton is updated. Not good.
                data["containing_page"] = 1
                ser = ContentObjectBaseSerializer(data=data)
                ser.is_valid()
                ser.save()
                setattr(self.instance, field, ser.instance)
        self.instance.save()

class SiteView(generics.RetrieveUpdateAPIView):
    """A simple View retrieving Site object."""
    serializer_class = SiteSerializer

    def get_object(self):
        return SiteModel.instance()
