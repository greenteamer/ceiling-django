# -*- coding: utf-8 -*-
from django.conf.urls import url, include
import ceilings.views as views


urlpatterns = [
	url(r'^natyazhnye-potolki/$', views.ceiling_list, name="ceiling_list"),
	url(r'^natyazhnye-potolki/ceilings/(?P<ceiling_slug>[-\w]+)/$', views.ceiling_item, name="ceiling_item"),
	url(r'^natyazhnye-potolki/filters/(?P<filter_slug>[-\w]+)/$', views.filter_item, name="filter_item"),
]
