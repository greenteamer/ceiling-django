# -*- coding: utf-8 -*-
from django.shortcuts import redirect, render_to_response
from django.template import RequestContext
from ceilings.models import Ceiling, Filter, FilterType
# Create your views here.

def ceiling_list(request, template_name="ceilings/ceiling_list.html"):
	# categories = Category.objects.all()
	ceilings = Ceiling.objects.all()
	title = u"Каталог потолков"
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def ceiling_item(request, filter_slug, ceiling_slug, template_name="ceilings/ceiling_item.html"):
	# category = Category.objects.get(slug=category_slug)
	ceiling = Ceiling.objects.get(slug=ceiling_slug)

	title = ""
	if ceiling.meta_title:
		title = ceiling.meta_title
	else:
		title = ceiling.name
	description = ceiling.meta_description

	return render_to_response(template_name, locals(), context_instance=RequestContext(request))
