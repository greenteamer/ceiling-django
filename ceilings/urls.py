# -*- coding: utf-8 -*-
from django.conf.urls import url, include
import ceilings.views as views


urlpatterns = [
	url(r'natyazhnye-potolki/$', views.ceiling_list, name="ceiling_list"),
  url(r'natyazhnye-potolki/(?P<filter_slug>[-\w]+)/(?P<ceiling_slug>[-\w]+)/$', views.ceiling_item, name="ceiling_item"),
]
