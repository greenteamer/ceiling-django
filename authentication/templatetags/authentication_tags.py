# -*- coding: utf-8 -*-
from django import template
register = template.Library()
from authentication.forms import LoginForm


def login_form(context, request):
	form = LoginForm()
	return {
		'form': form,
		'request': request,
	}
register.inclusion_tag('authentication/tags/login_form.html', takes_context=True)(login_form)
