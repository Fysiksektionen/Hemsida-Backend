from django.urls import path
from rest_framework.routers import DefaultRouter
from website.views.general import PathResolveView
from website.views.menus import MenuViewSet
from website.views.pages import  PageView, PagesView
from website.views.redirects import RedirectViewSet
from website.views.site import SiteView
from website.views.news import NewsItemView, NewsViewSet
from website.views.image import ImageView, ImagesView

app_name = 'website'

# Routs/urls for menus and menu-items
router = DefaultRouter()
router.register(r'menus', MenuViewSet, basename='menu')
router.register(r'redirects', RedirectViewSet, basename='redirect')

# Url-patterns for website app.
urlpatterns = [
    *router.urls,
    path('site/', SiteView.as_view(), name="site"),
    path('pages/', PagesView.as_view(), name='pages'),
    path('pages/<int:pk>', PageView.as_view(), name='page'),
    path('news/', NewsViewSet.as_view(), name='news'),
    path('news/<int:pk>', NewsItemView.as_view(), name='news_item'),
    path('resolve-url/', PathResolveView.as_view(), name="resolve_url"),
    path('images/', ImagesView.as_view(), name='images'),
    path('images/<int:pk>', ImageView.as_view(), name='images')
]
