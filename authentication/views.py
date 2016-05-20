# -*- coding: utf-8 -*-
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from authentication.forms import LoginForm, RegisterForm
import json

def logoutView(request):
	logout(request)
	return HttpResponseRedirect('/')


def loginView(request,template_name="authentication/login.html"):
	if request.user.is_authenticated():
		return HttpResponseRedirect('/')

	if request.method == "POST":
		form = LoginForm(request.POST)
		if form.is_valid():
			username = request.POST['username']
			password = request.POST['password']
			user = authenticate(username=username, password=password)
			if user is not None:
				# the password verified for the user
				if user.is_active:
					login(request, user)

	return HttpResponseRedirect('/')


def registerView(request, template_name="authentication/register.html"):
	if request.user.is_authenticated():
		return HttpResponseRedirect('/')

	if request.method == 'POST':
		form = RegisterForm(request.POST)
		if form.is_valid():
			email = request.POST['email']
			password = request.POST['password']
			username = email.split("@")[0]
			print "..... username: %s" % username
			new_user = User.objects.create_user(email=email, password=password, username=username)
			new_user.backend = 'django.contrib.auth.backends.ModelBackend'
			login(request, new_user)
	return HttpResponseRedirect('/')
