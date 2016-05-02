# -*- coding: utf-8 -*-
# !/usr/bin/env python

from django.conf.urls import url
from configs.views import subscribe_view

urlpatterns = [
    url(r"^subscribe$", subscribe_view, name="subscribe"),
]
