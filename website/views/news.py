from rest_framework.fields import empty
from website.views.pages import COImageSerializer, ContentImageSerializer, PageSerializer, serialize_item
from website.views.image import ImageSerializer
from rest_framework import generics, viewsets, mixins
from utils.serializers import DBObjectSerializer
from website.models.news import News


class NewsSerializer(PageSerializer):
    """Serializer for rendering a News page. Shows id and detail_url of news pages."""

    class Meta:
        model = News
        fields = ['name', 'url', 'slug', 'page_type', 'published', 'author', 'views',
                  'first_published_at', 'last_edited_at', 'publish_time', 'unpublish_time',
                  'content_sv', 'content_en', 'news_draft', 'preamble', 'image']
        depth = 1
        nested_serialization = {
            'news_draft': {
                'fields': ['page_type', 'content_sv', 'content_en']
            }
        }

# TODO: The detail_url points at pages, when it should probably point at /api/news/{id}
class NewsViewSet(generics.ListCreateAPIView):
    """A simple ViewSet for listing and retrieving News pages."""
    serializer_class = NewsSerializer
    queryset = News.objects.all()

class NewsItemView(generics.RetrieveUpdateDestroyAPIView):
    """A simple view for fetching, updating and deleting news items."""
    serializer_class = NewsSerializer
    queryset = News.objects.all()
