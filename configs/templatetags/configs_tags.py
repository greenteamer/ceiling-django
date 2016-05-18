#-*- coding: utf-8 -*-
from django import template
from configs.models import *
from configs.methods import get_site_config
from configs.forms import ContactForm

register = template.Library()


def top_menu(context, request):
    config = get_site_config(request)
    return {
        'config': config,
        'request': request,
    }
register.inclusion_tag('configs/tags/top_menu.html', takes_context=True)(top_menu)


def contact_form(context, request):
    form = ContactForm()
    return {
        'form': form,
        'request': request,
    }
register.inclusion_tag('configs/tags/contact_form.html', takes_context=True)(contact_form)


def base_menu(context, request):
    try:
        config = Config.objects.get(site__domain=request.get_host())
    except Exception:
        config = Config.objects.get(site__domain="example.com")
    return {
        'config': config,
        'user': request.user,
        'request': request,
    }
register.inclusion_tag('configs/tags/base_menu.html', takes_context=True)(base_menu)
