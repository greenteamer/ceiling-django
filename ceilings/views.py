# -*- coding: utf-8 -*-
from django.shortcuts import redirect, render_to_response
from django.template import RequestContext
from ceilings.models import Ceiling, Filter, FilterType
from configs.forms import CeilingForm
# Create your views here.

def ceiling_list(request, template_name="ceilings/ceiling_list.html"):
	ceilings = Ceiling.objects.all()
	title = u"Каталог потолков"
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def ceiling_item(request, ceiling_slug, template_name="ceilings/ceiling_item.html"):
	ceiling = Ceiling.objects.get(slug=ceiling_slug)

	title = ""
	if ceiling.meta_title:
		title = ceiling.meta_title
	else:
		title = ceiling.name
	description = ceiling.meta_description

	form = CeilingForm(initial={'ceiling': ceiling.id})
	print "template name: %s" % template_name

	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def filter_item(request, filter_slug, template_name="ceilings/filter_item.html"):
	# categories = Category.objects.all()
	filter = Filter.objects.get(slug=filter_slug)
	ceilings = Ceiling.filter_objects.by_filter_slug(filter_slug=filter_slug)
	title = u"Каталог потолков"
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))
