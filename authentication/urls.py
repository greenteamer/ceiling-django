# -*- coding: utf-8 -*-
# !/usr/bin/env python

from django.conf.urls import url
from authentication.views import *

urlpatterns = [
    url(r'logout/$', logoutView),
    url(r'login/$', loginView),
    url(r'register/$', registerView),
    url(r'account/$', accountView),
    url(r'populate-profile/$', populateProfileView),
]
