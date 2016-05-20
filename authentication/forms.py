#-*- coding: utf-8 -*-
from django.forms import ModelForm,Form
from django import forms
from django.utils.translation import gettext as _


class LoginForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super(LoginForm, self).__init__(*args, **kwargs)
		self.fields['username'].widget.attrs = {'placeholder':'имя пользователя', 'class':'form-control'}
		self.fields['password'].widget.attrs = {'placeholder':'пароль', 'class':'form-control'}
		self.fields['username'].label = ""
		self.fields['password'].label = ""

	username = forms.CharField()
	password = forms.CharField(widget=forms.PasswordInput)

	class Meta:
		fields = [
			'username',
			'password'
		]
		labels = {
			"username": u"",
			"password": u"",
		}


class RegisterForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super(RegisterForm, self).__init__(*args, **kwargs)
		self.fields['email'].widget.attrs = {'placeholder':'Ваша почта', 'class':'form-control'}
		self.fields['password'].widget.attrs = {'placeholder':'пароль', 'class':'form-control'}
		self.fields['email'].label = ""
		self.fields['password'].label = ""

	email = forms.EmailField()
	password = forms.CharField(widget=forms.PasswordInput)

	class Meta:
		fields = [
			'email',
			'password'
		]
		labels = {
			"email": u"",
			"password": u"",
		}
