# -*- coding: utf-8 -*-
# !/usr/bin/env python

from django.conf.urls import url
from configs.views import subscribe_view, contact_form_view

urlpatterns = [
    url(r"^subscribe/$", subscribe_view, name="subscribe"),
    url(r"^contact-form/$", contact_form_view, name="contact_form_view"),
]
