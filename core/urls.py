# -*- coding: utf-8 -*-
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
import core.views as views


urlpatterns = [
    # url(r'^$', views.ContactFormView.as_view(), name="home"),
    # url(r'(?P<title>[^/]+)/$', views.redirect, name='redirect'),
    # url(ur'разрешение-на-строительство/$', views.redirect, name='redirect'),
    url(r'^$', views.home, name="home"),
    url(r'natyazhnye-potolki/(?P<category_slug>[-\w]+)/(?P<page_slug>[-\w]+)/$', views.page_item, name="page_item"),
    url(r'natyazhnye-potolki/$', views.ceilings, name="ceilings"),
    url(r'services/$', views.services, name="service_list"),
    url(r'services/(?P<slug>[-\w]+)/$', views.service_item, name="service_item"),
    # url(r'pages/(?P<slug>[-\w]+)/$', views.page_item, name="page_item"),
    url(r'posts/(?P<slug>[-\w]+)/$', views.post_item, name="post_item"),
    url(r'posts/$', views.post_list, name="post_list"),
    url(r'success/$', views.success, name="success"),
]
