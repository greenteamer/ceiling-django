# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.template import RequestContext
from configs.forms import SubscribeForm


def subscribe_view(request, template_name="configs/success.html"):
    if request.method is "POST":
        form = SubscribeForm(request.POST)

        if form.is_valid():
            form.send_mail()

    return render_to_response(template_name, locals(), context_instance=RequestContext(request))
