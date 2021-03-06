# -*- coding: utf-8 -*-
from django import template
register = template.Library()
from configs.methods import get_site_config
from siteprojects.models import Project
from core.models import Page, Post
from ceilings.models import Ceiling, Filter, FilterType


def phone(context, request):
    return {
    	# 'configs': configs,
        'request': request,
    }
register.inclusion_tag('core/tags/phone.html', takes_context=True)(phone)


def footer(context, request):
    config = get_site_config(request)
    project_list = Project.objects.order_by('created_at')[:3]
    post_list = Post.objects.order_by('created_at')[:3]
    page_list = Page.objects.order_by('created_at')[:3]
    return {
        'config': config,
        'request': request,
        'project_list': project_list,
        'post_list': post_list,
        'page_list': page_list
    }
register.inclusion_tag('core/tags/footer.html', takes_context=True)(footer)


# def contact_form(context, request):
#     config = get_site_config(request)
#     return {
#         'config': config,
#         'request': request,
#     }
# register.inclusion_tag('core/tags/contact_form.html', takes_context=True)(contact_form)


def search_tag(context, request):
    return {
    	# 'configs': configs,
        'request': request,
    }
register.inclusion_tag('core/tags/search_tag.html', takes_context=True)(search_tag)


def sidebar(context, request):
    # categories = Category.objects.all()
    categories = []
    return {
        'categories': categories,
        'request': request,
    }
register.inclusion_tag('core/tags/sidebar.html', takes_context=True)(sidebar)
