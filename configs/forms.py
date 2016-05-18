#-*- coding: utf-8 -*-
from django import forms
from django.core.mail import send_mail
from methods import get_site_config


class ContactForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super(ContactForm, self).__init__(*args, **kwargs)
		self.fields['name'].widget.attrs = {'placeholder':'Ваше имя', 'class':'form-control'}
		self.fields['phone'].widget.attrs = {'placeholder':'Ваш телефон', 'class':'form-control', 'id': 'phone'}
		self.fields['name'].label = ""
		self.fields['phone'].label = ""
	name = forms.CharField()
	phone = forms.CharField()

	class Meta:
		fields = [
			'name',
			'phone',
		]
		labels = {
			"name": u"",
			"phone": u""
		}

	def send_email(self, request):
		print "................start send_email"
		data = self.cleaned_data
		# получаем данные конфигурации сайта
		config = get_site_config(request)
		# отправка формы
		subject = u'Контактные данные пользователя %s' % config.site.domain
		message = u'Имя: %s \n телефон: %s' % (data['name'], data['phone'])
		send_mail(subject, message, 'teamer777@gmail.com', [config.site_email], fail_silently=False)


class CeilingForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super(CeilingForm, self).__init__(*args, **kwargs)
		self.fields['name'].widget.attrs = {'placeholder':'Ваше имя', 'class':'form-control'}
		self.fields['phone'].widget.attrs = {'placeholder':'Ваш телефон', 'class':'form-control'}
		self.fields['name'].label = ""
		self.fields['phone'].label = ""
	name = forms.CharField()
	phone = forms.CharField()
	ceiling = forms.IntegerField(widget=forms.HiddenInput)

	class Meta:
		fields = [
			'name',
			'phone',
			'ceiling'
		]
		labels = {
			"name": u"",
			"phone": u""
		}

	def send_email(self, request):
		print "................start send_email"
		data = self.cleaned_data
		# получаем данные конфигурации сайта
		config = get_site_config(request)
		# отправка формы
		subject = u'Контактные данные пользователя %s' % config.site.domain
		message = u'Имя: %s \n телефон: %s' % (data['name'], data['phone'])
		send_mail(subject, message, 'teamer777@gmail.com', [config.site_email], fail_silently=False)


class SubscribeForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super(SubscribeForm, self).__init__(*args, **kwargs)
		self.fields['name'].widget.attrs = {'placeholder':'Ваше имя', 'class':'form-control'}
		self.fields['email'].widget.attrs = {'placeholder':'Ваш email', 'class':'form-control'}
		self.fields['text'].widget.attrs = {'placeholder':'Поле для вопроса', 'class':'form-control'}
		self.fields['name'].label = ""
		self.fields['email'].label = ""
		self.fields['text'].label = ""
	name = forms.CharField()
	phone = forms.CharField()
	phone = forms.Textarea()

	class Meta:
		fields = [
			'name',
			'phone',
			'text'
		]
		labels = {
			"name": u"",
			"phone": u"",
			"text": u""
		}

	def send_email(self, request):
		data = self.cleaned_data
		# получаем данные конфигурации сайта
		config = get_site_config(request)
		# отправка формы
		subject = u'Подписка пользователя %s' % config.site.domain
		message = u'Имя: %s \n email: %s \n вопрос: %s' % (data['name'], data['email'], data['text'])
		send_mail(subject, message, 'teamer777@gmail.com', [config.site_email], fail_silently=False)

