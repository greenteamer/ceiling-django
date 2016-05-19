# -*- coding: utf-8 -*-
from django.shortcuts import redirect, render_to_response
from django.template import RequestContext
from ceilings.models import Ceiling, Filter, FilterType
from configs.forms import CeilingForm
from core.functions import get_meta
# Create your views here.

def ceiling_list(request, template_name="ceilings/ceiling_list.html"):
	ceilings = Ceiling.objects.all()
	title = u"Каталог потолков"
	description = u""
	keywords = u""
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def ceiling_item(request, ceiling_slug, template_name="ceilings/ceiling_item.html"):
	ceiling = Ceiling.objects.get(slug=ceiling_slug)
	title, description, keywords = get_meta(ceiling)
	form = CeilingForm(initial={'ceiling': ceiling.id})
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def filter_item(request, filter_slug, template_name="ceilings/filter_item.html"):
	# categories = Category.objects.all()
	filter = Filter.objects.get(slug=filter_slug)
	ceilings = Ceiling.filter_objects.by_filter_slug(filter_slug=filter_slug)
	title, description, keywords = get_meta(filter)
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))
