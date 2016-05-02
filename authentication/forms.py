#-*- coding: utf-8 -*-
from django.forms import ModelForm,Form
from django import forms
from authentication import models
from django.utils.translation import gettext as _


class AccountForm(ModelForm):
	def __init__(self, *args, **kwargs):
		super(AccountForm, self).__init__(*args, **kwargs)
		self.fields['email'].widget.attrs = {'placeholder':'Ваш email', 'class':'form-control'}
		self.fields['username'].widget.attrs = {'placeholder':'Имя пользователя', 'class':'form-control'}
		self.fields['password'].widget.attrs = {'placeholder':'Ваш пароль', 'class':'form-control'}
	
	class Meta:
		model = models.Account
		fields = [
			'email',
			'username',
			'password'
		]
		labels = {
			"email": u"",
			"username": u"",
			"password": u""
		}
		error_messages = {
			"email": {
				'required': u"Поле 'Email' обязательно для заполнения.",
			},
			"username": {
				'required': u"Поле 'Имя пользователя' обязательно для заполнения.",
			},
			"password": {
				'required': u"Поле 'Пароль' обязательно для заполнения.",
			}
		}


class PerformerProfileForm(ModelForm):
	def __init__(self, *args, **kwargs):
		super(PerformerProfileForm, self).__init__(*args, **kwargs)
		self.fields['first_name'].widget.attrs = {'placeholder':'Ваше Имя', 'class':'form-control'}
		self.fields['last_name'].widget.attrs = {'placeholder':'Ваша Фамилия', 'class':'form-control'}
		self.fields['phone'].widget.attrs = {'placeholder':'Телефон', 'class':'form-control'}

	class Meta:
		model = models.PerformerProfile
		fields = [
			'first_name',
			'last_name',
			'phone',
		]
		labels = {
			"first_name": u"",
			"last_name": u"",
			"phone": u"",
		}
		error_messages = {
			"first_name": {
				'required': u"Поле 'Имя Отчество' обязательно для заполнения.",
			},
			"last_name": {
				'required': u"Поле 'Фамилия' обязательно для заполнения.",
			},
			"phone": {
				'required': u"Поле 'Телефон' обязательно для заполнения.",
			}
		}


class CustomerProfileForm(ModelForm):
	def __init__(self, *args, **kwargs):
		super(CustomerProfileForm, self).__init__(*args, **kwargs)
		self.fields['first_name'].widget.attrs = {'placeholder':'Ваше Имя', 'class':'form-control'}
		self.fields['last_name'].widget.attrs = {'placeholder':'Ваша Фамилия', 'class':'form-control'}
		self.fields['phone'].widget.attrs = {'placeholder':'Телефон', 'class':'form-control'}

	class Meta:
		model = models.PerformerProfile
		fields = [
			'first_name',
			'last_name',
			'phone',
		]
		labels = {
			"first_name": u"",
			"last_name": u"",
			"phone": u"",
		}
		error_messages = {
			"first_name": {
				'required': u"Поле 'Имя Отчество' обязательно для заполнения.",
			},
			"last_name": {
				'required': u"Поле 'Фамилия' обязательно для заполнения.",
			},
			"phone": {
				'required': u"Поле 'Телефон' обязательно для заполнения.",
			}
		}


class DeliveryForm(Form):
	REGIONS = [('АБАКАН', 'АБАКАН'),  ('АНАДЫРЬ', 'АНАДЫРЬ'),  ('АРХАНГЕЛЬСК', 'АРХАНГЕЛЬСК'),  ('АСТРАХАНЬ', 'АСТРАХАНЬ'), ('БАРНАУЛ', 'БАРНАУЛ'),  ('БЕЛГОРОД', 'БЕЛГОРОД'),  ('БИРОБИДЖАН', 'БИРОБИДЖАН'),  ('БЛАГОВЕЩЕНСК', 'БЛАГОВЕЩЕНСК'),  ('БРЯНСК', 'БРЯНСК'),  ('ВЕЛИКИЙ НОВГОРОД', 'ВЕЛИКИЙ НОВГОРОД'),  ('ВЛАДИВОСТОК', 'ВЛАДИВОСТОК'),  ('ВЛАДИКАВКАЗ', 'ВЛАДИКАВКАЗ'),  ('ВЛАДИМИР', 'ВЛАДИМИР'),  ('ВОЛГОГРАД', 'ВОЛГОГРАД'),  ('ВОЛОГДА', 'ВОЛОГДА'),  ('ВОРОНЕЖ', 'ВОРОНЕЖ'),  ('ГОРНО-АЛТАЙСК', 'ГОРНО-АЛТАЙСК'),  ('ГРОЗНЫЙ', 'ГРОЗНЫЙ'),  ('ЕКАТЕРИНБУРГ', 'ЕКАТЕРИНБУРГ'),  ('ИВАНОВО', 'ИВАНОВО'),  ('ИЖЕВСК', 'ИЖЕВСК'),  ('ИРКУТСК', 'ИРКУТСК'), ('ЙОШКАР-ОЛА', 'ЙОШКАР-ОЛА'), ('КАЗАНЬ', 'КАЗАНЬ'), ('КАЛИНИНГРАД', 'КАЛИНИНГРАД'),  ('КАЛУГА', 'КАЛУГА'),  ('КЕМЕРОВО', 'КЕМЕРОВО'),  ('КИРОВ', 'КИРОВ'),  ('КОСТРОМА', 'КОСТРОМА'),  ('КРАСНОДАР', 'КРАСНОДАР'),  ('КРАСНОЯРСК', 'КРАСНОЯРСК'),  ('КУРГАН', 'КУРГАН'),  ('КУРСК', 'КУРСК'),  ('КЫЗЫЛ', 'КЫЗЫЛ'),  ('ЛИПЕЦК', 'ЛИПЕЦК'),  ('МАГАДАН', 'МАГАДАН'),  ('МАЙКОП', 'МАЙКОП'),  ('МАХАЧКАЛА', 'МАХАЧКАЛА'),  ('МОСКВА', 'МОСКВА'),  ('МУРМАНСК', 'МУРМАНСК'),  ('НАЗРАНЬ', 'НАЗРАНЬ'),  ('НАЛЬЧИК', 'НАЛЬЧИК'),  ('НАРЬЯН-МАР', 'НАРЬЯН-МАР'),  ('НИЖНИЙ НОВГОРОД', 'НИЖНИЙ НОВГОРОД'),  ('НОВОСИБИРСК', 'НОВОСИБИРСК'),  ('ОМСК', 'ОМСК'),  ('ОРЕНБУРГ', 'ОРЕНБУРГ'),  ('ОРЁЛ', 'ОРЁЛ'),  ('ПЕНЗА', 'ПЕНЗА'),  ('ПЕРМЬ', 'ПЕРМЬ'),  ('ПЕТРОЗАВОДСК', 'ПЕТРОЗАВОДСК'),  ('ПЕТРОПАВЛОВСК-КАМЧАТСКИЙ', 'ПЕТРОПАВЛОВСК-КАМЧАТСКИЙ'),  ('ПСКОВ', 'ПСКОВ'),  ('РОСТОВ-НА-ДОНУ', 'РОСТОВ-НА-ДОНУ'),  ('РЯЗАНЬ', 'РЯЗАНЬ'),  ('САЛЕХАРД', 'САЛЕХАРД'),  ('САМАРА', 'САМАРА'),  ('САНКТ-ПЕТЕРБУРГ', 'САНКТ-ПЕТЕРБУРГ'),  ('САРАНСК', 'САРАНСК'),  ('САРАТОВ', 'САРАТОВ'),  ('СИМФЕРОПОЛЬ', 'СИМФЕРОПОЛЬ'),  ('СМОЛЕНСК', 'СМОЛЕНСК'),  ('СТАВРОПОЛЬ', 'СТАВРОПОЛЬ'),  ('СЫКТЫВКАР', 'СЫКТЫВКАР'),  ('ТАМБОВ', 'ТАМБОВ'),  ('ТВЕРЬ', 'ТВЕРЬ'),  ('ТОМСК', 'ТОМСК'),  ('ТУЛА', 'ТУЛА'),  ('ТЮМЕНЬ', 'ТЮМЕНЬ'),  ('УЛАН-УДЭ', 'УЛАН-УДЭ'),  ('УЛЬЯНОВСК', 'УЛЬЯНОВСК'),  ('УФА', 'УФА'),  ('ХАБАРОВСК', 'ХАБАРОВСК'),  ('ХАНТЫ-МАНСИЙСК', 'ХАНТЫ-МАНСИЙСК'),  ('ЧЕБОКСАРЫ', 'ЧЕБОКСАРЫ'),  ('ЧЕЛЯБИНСК', 'ЧЕЛЯБИНСК'),  ('ЧЕРКЕССК', 'ЧЕРКЕССК'),  ('ЧИТА', 'ЧИТА'),  ('ЭЛИСТА', 'ЭЛИСТА'),  ('ЮЖНО-САХАЛИНСК', 'ЮЖНО-САХАЛИНСК'),  ('ЯКУТСК', 'ЯКУТСК'),  ('ЯРОСЛАВЛЬ', 'ЯРОСЛАВЛЬ'),]
	region = forms.ChoiceField(choices=REGIONS, widget=forms.Select(attrs={'class': 'set_region'}))
