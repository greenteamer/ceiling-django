# -*- coding: utf-8 -*-
from django.contrib.sitemaps import Sitemap
from core.models import Service, Post, Page


class HomeSitemap(Sitemap):
	changefreq = "monthly"
	priority = 1

	def items(self):
		return ["index"]

	def location(self, item):
		return "/"


class ServiceSitemap(Sitemap):
	changefreq = "monthly"
	priority = 0.5

	def items(self):
		return Service.objects.all()

	def lastmod(self, obj):
		return obj.created_at


class PostSitemap(Sitemap):
	changefreq = "monthly"
	priority = 0.5

	def items(self):
		return Post.objects.all()

	def lastmod(self, obj):
		return obj.created_at


class PageSitemap(Sitemap):
	changefreq = "monthly"
	priority = 0.5

	def items(self):
		return Page.objects.all()

	def lastmod(self, obj):
		return obj.created_at
