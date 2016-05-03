"""monolit URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from flatblocks.views import edit
from django.contrib.auth.decorators import login_required
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
    url(r'^', include('core.urls')),
    url(r'^', include('authentication.urls')),
    url(r'^', include('configs.urls')),
    url(r'^', include('siteprojects.urls'))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
