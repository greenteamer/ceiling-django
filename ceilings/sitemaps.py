# -*- coding: utf-8 -*-
from django.contrib.sitemaps import Sitemap
from ceilings.models import Ceiling, Filter

class CeilingSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.5

    def items(self):
        return Ceiling.objects.all()

    def lastmod(self, obj):
        return obj.created_at


class FilterSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.5

    def items(self):
        return Filter.objects.all()

    def lastmod(self, obj):
        return obj.created_at
