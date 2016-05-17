# -*- coding: utf-8 -*-
from django import template
register = template.Library()
from configs.methods import get_site_config
from siteprojects.models import Project
from core.models import Page, Post
from ceilings.models import Ceiling, Filter, FilterType


def catalog_list(context, request):
	filter_types = FilterType.objects.all()
	return {
		'filter_types': filter_types,
		'request': request,
	}
register.inclusion_tag('ceilings/tags/catalog_list.html', takes_context=True)(catalog_list)
