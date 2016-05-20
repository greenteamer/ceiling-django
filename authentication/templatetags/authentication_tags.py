# -*- coding: utf-8 -*-
from django import template
register = template.Library()
from authentication.forms import LoginForm, RegisterForm


def login_form(context, request):
	form = LoginForm()
	return {
		'form': form,
		'request': request,
	}
register.inclusion_tag('authentication/tags/form.html', takes_context=True)(login_form)


def register_form(context, request):
	form = RegisterForm()
	return {
		'form': form,
		'request': request,
	}
register.inclusion_tag('authentication/tags/form.html', takes_context=True)(register_form)
