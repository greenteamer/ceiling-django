# -*- coding: utf-8 -*-
from django.contrib.auth import logout, login, authenticate
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from authentication.forms import AccountForm, PerformerProfileForm, CustomerProfileForm
from authentication.models import Account, PerformerProfile, CustomerProfile


def logoutView(request):
    logout(request)
    return HttpResponseRedirect('/')


def loginView(request,template_name="authentication/login.html"):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/')

    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/account')
        else:
            message = u'неправильно введен логин или пароль! Попробуйте еще раз'
    else:
        form = AccountForm()
    return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def registerView(request, template_name="authentication/register.html"):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/')
    else:
        f = AccountForm()

    if request.method == 'POST':
        f = AccountForm(request.POST)
        if f.is_valid():
            email = request.POST['email']
            password = request.POST['password']
            username = request.POST['username']
            new_user = Account.objects.create_user(email, password=password, username=username)
            login(request, new_user)
            return HttpResponseRedirect('/account')
        else:
            message = u'неправильно введен логин или пароль! Попробуйте еще раз'
    return render_to_response(template_name, locals(), context_instance=RequestContext(request))    


def accountView(request, template_name="authentication/account.html"):
    return render_to_response(template_name, locals(), context_instance=RequestContext(request))    


def populateProfileView(request, template_name="authentication/populate_profile.html"):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login')
    else:
        f = PerformerProfileForm()
    if request.method == 'POST':
        if request.user.role == 'teacher':
            instance = PerformerProfile(account=request.user)
            f = PerformerProfileForm(request.POST, instance=instance)
            f.save()
        elif request.user.role == 'student':
            instance = CustomerProfile(account=request.user)
            f = CustomerProfileForm(request.POST, instance=instance)
            f.save()

    return render_to_response(template_name, locals(), context_instance=RequestContext(request))    
