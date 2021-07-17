from project_settings.settings.local import ROOT_URL
from website.models.media import Image
from rest_framework import serializers, generics 
from utils.serializers import DBObjectSerializer

class ImageSerializer(DBObjectSerializer):
    """Serializer for rendering an image"""

    class Meta: 
        model = Image
        depth = 1
        fields = '__all__'

    # Frontend alias for image.
    href = serializers.ImageField(source="image")


class ImagesView(generics.ListCreateAPIView):
    """A simple view for listing and creating images"""
    serializer_class = ImageSerializer
    queryset = Image.objects.all()

class ImageView(generics.RetrieveUpdateDestroyAPIView):
    """"A simple view for fetching, updating and deleting images."""
    serializer_class = ImageSerializer
    queryset = Image.objects.all()