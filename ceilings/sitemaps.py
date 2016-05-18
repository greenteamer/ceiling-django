# -*- coding: utf-8 -*-
from django.contrib.sitemaps import Sitemap
from ceilings.models import Ceiling

class CeilingSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.5

    def items(self):
        return Ceiling.objects.all()

    def lastmod(self, obj):
        return obj.created_at
