from django.db import models
from django.utils.translation import gettext_lazy as _

from website.models.abstract_singleton import SingletonModel
from website.models.content_objects import ContentCollection
from website.models.pages import Page


class SiteModel(SingletonModel):

    class Meta:
        verbose_name = _("site manager")
        verbose_name_plural = _("site manager")  # Ska bara skrivas i singular

    root_url = models.URLField(verbose_name=_('root URL'), blank=False, null=False)
    api_root_url = models.URLField(verbose_name=_('API root URL'), blank=False, null=False)

    root_page = models.ForeignKey(Page, verbose_name=_('root page'), blank=False, null=False, on_delete=models.RESTRICT)

    # Didn't find a nice way to do this but what ever...
    banner_content_sv = models.ForeignKey(ContentCollection, verbose_name=_('swedish banner content'), related_name='banner_content_sv', blank=True, null=True, on_delete=models.RESTRICT)
    footer_content_sv = models.ForeignKey(ContentCollection, verbose_name=_('swedish footer content'), related_name='footer_content_sv', blank=True, null=True, on_delete=models.RESTRICT)
    banner_content_en = models.ForeignKey(ContentCollection, verbose_name=_('english banner content'), related_name='banner_content_en', blank=True, null=True, on_delete=models.RESTRICT)
    footer_content_en = models.ForeignKey(ContentCollection, verbose_name=_('english footer content'), related_name='footer_content_en', blank=True, null=True, on_delete=models.RESTRICT)