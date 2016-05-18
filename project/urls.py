# -*- coding: utf-8 -*-
from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from flatblocks.views import edit
from django.contrib.auth.decorators import login_required
# SITEMAPS
from django.contrib.sitemaps.views import sitemap
from ceilings.sitemaps import CeilingSitemap
sitemaps = {
    'ceilings': CeilingSitemap,
}
# REST API
from rest_framework import routers
from restapi.views import *



router = routers.DefaultRouter()
router.register(r'accounts', AccountsViewSet)


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/', include(router.urls)),
    url(r'^flatblocks/(?P<pk>\d+)/edit/$', login_required(edit), name='flatblocks-edit'),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^robots\.txt$', include('robots.urls')),
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
    url(r'^', include('core.urls')),
    url(r'^', include('ceilings.urls')),
    url(r'^', include('authentication.urls')),
    url(r'^', include('configs.urls')),
    url(r'^', include('siteprojects.urls'))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
