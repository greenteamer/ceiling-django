# -*- coding: utf-8 -*-
from django.conf.urls import url, include
import core.views as views


urlpatterns = [
    # url(r'^$', views.ContactFormView.as_view(), name="home"),
    # url(r'(?P<title>[^/]+)/$', views.redirect, name='redirect'),
    # url(ur'разрешение-на-строительство/$', views.redirect, name='redirect'),
    url(r'^$', views.home, name="home"),
    url(r'services/$', views.services, name="service_list"),
    url(r'services/(?P<slug>[-\w]+)/$', views.service_item, name="service_item"),
    url(r'pages/(?P<slug>[-\w]+)/$', views.page_item, name="page_item"),
    url(r'posts/$', views.post_list, name="post_list"),
    url(r'posts/(?P<slug>[-\w]+)/$', views.post_item, name="post_item"),
    url(r'success/$', views.success, name="success"),
]
