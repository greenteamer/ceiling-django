# -*- coding: utf-8 -*-
# !/usr/bin/env python

from django.conf.urls import url
from configs.views import subscribe_view, ceiling_form_view, contact_form_view, ajax_zamer_view, ajax_calculator_view

urlpatterns = [
    url(r"^subscribe/$", subscribe_view, name="subscribe"),
    url(r"^contact-form/$", contact_form_view, name="contact_form_view"),
    url(r"^ceiling-form/$", ceiling_form_view, name="ceiling_form_view"),
    url(r"^ajax/zamer/$", ajax_zamer_view, name="ajax_zamer_view"),
    url(r"^ajax/calculator/$", ajax_calculator_view, name="ajax_calculator_view")
]
