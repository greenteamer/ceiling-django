# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.template import RequestContext
from configs.forms import SubscribeForm, CeilingForm, ContactForm
import json
from django.http import HttpResponse
from django.core.mail import send_mail
from methods import get_site_config


def subscribe_view(request, template_name="configs/success.html"):
	if request.method is "POST":
		form = SubscribeForm(request.POST)

		if form.is_valid():
			form.send_mail()

	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def contact_form_view(request, template_name="configs/success.html"):
	if request.method == "POST":
		form = ContactForm(request.POST)

		if form.is_valid():
			form.send_email(request)
		else:
			template_name = "configs/fail.html"
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def ceiling_form_view(request, template_name="configs/success.html"):
	if request.method == "POST":
		form = CeilingForm(request.POST)

		if form.is_valid():
			form.send_email(request)
		else:
			template_name = "configs/fail.html"
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def ajax_zamer_view(request):
	print ".......... start ajax_zamer_view"
	phone = request.POST["phone"]
	config = get_site_config(request)
	subject = u'Вызов замерщика'
	message = u'телефон: %s' % phone
	send_mail(subject, message, 'teamer777@gmail.com', [config.site_email], fail_silently=False)
	data = json.dumps({
		"phone": phone
	})
	return HttpResponse(data, content_type="application/json")


def ajax_calculator_view(request):
	print ".......... start ajax_calculator_view"
	phone = request.POST["phone"]
	square = request.POST["square"]
	angle = request.POST["angle"]
	tube = request.POST["tube"]
	perforation = request.POST["perforation"]
	zakladnaya = request.POST["zakladnaya"]
	strut = request.POST["strut"]
	tip_polotna = request.POST["tip_polotna"]
	brend_polotna = request.POST["brend_polotna"]
	config = get_site_config(request)
	subject = u'Вызов замерщика'
	message = u'телефон: %s, площадь потолка: %s, Фактура полотна: %s, количество углов %s, Торговая марка потолка: %s, Трубы уходящие в потолок: %s, Закладная под потолочную люстру: %s, Отверстие под крючковую люстру: %s, Стойка под встраиваемый светильник: %s '% (phone, square, tip_polotna, angle, brend_polotna, tube, zakladnaya, perforation, strut)
	send_mail(subject, message, 'teamer777@gmail.com', [config.site_email], fail_silently=False)
	data = json.dumps({
		"phone": phone
	})
	return HttpResponse(data, content_type="application/json")
