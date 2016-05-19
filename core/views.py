# -*- coding: utf-8 -*-
from django.shortcuts import redirect, render_to_response
from django.template import RequestContext
from configs.forms import ContactForm
from django.views.generic.edit import FormView
from siteprojects.models import Project
from core.models import Service, Post, Review, Partner, Page
from configs.methods import get_site_config
from ceilings.models import FilterType, Filter, Ceiling
from core.functions import get_meta




def home(request, template_name="core/home.html"):
	# получаем все потолки по фактуре , берем первые 3
	# получаем по фильтру многоуровневые, берем 1
	# возвращаем список из 4 объектов потолков
	filter_type = FilterType.objects.get(slug="po-fakture")
	ceilings = Ceiling.filter_objects.by_filter_type(filter_type=filter_type)[:3]
	ceilings_multylavels = Ceiling.filter_objects.by_filter_slug(filter_slug="mnogourovnevye")[0]
	ceilings.append(ceilings_multylavels)
	# подготовка текста "о нас"
	about_page = Page.objects.get(slug='o-nas')
	title = u"Главная"
	description = u""
	keywords = u""
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))



class ContactFormView(FormView):
	template_name = "core/home.html"
	form_class = ContactForm
	success_url = "/success"

	def get_context_data(self, **kwargs):
		context = super(ContactFormView, self).get_context_data(**kwargs)
		context['project_list'] = Project.objects.all()
		context['service_list'] = service_list = Service.objects.filter(is_home=True)
		context['service_main'] = Service.objects.get(is_main=True)
		context['post_list'] = Post.objects.all()
		context['review_list'] = Review.objects.all()
		context['partner_list'] = Partner.objects.all()
		context['page_list'] = Page.objects.all()
		context['config'] = get_site_config(self.request)

		config = get_site_config(self.request)
		context['title'] = config.site_name
		context['description'] = config.site_description
		return context

	def form_valid(self, form):
		form.send_email(self.request)
		return super(ContactFormView, self).form_valid(form)


def services(request, template_name="core/services.html"):
	services = Service.objects.all()
	title = u"Услуги"
	description = u""
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def service_item(request, slug, template_name="core/service_item.html"):
	service = Service.objects.get(slug=slug)
	title, description, keywords = get_meta(service)
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def page_item(request, page_slug, template_name="core/page_item.html"):
	# category = Category.objects.get(slug=category_slug)
	page = Page.objects.get(slug=page_slug)
	title, description, keywords = get_meta(page)
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def post_item(request, slug, template_name="core/post_item.html"):
	post = Post.objects.get(slug=slug)
	title, description, keywords = get_meta(post)
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def post_list(request, template_name="core/post_list.html"):
	posts = Post.objects.all()
	title = u"Статьи"
	description = u""
	keywords = u""
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def success(request, template_name="configs/success.html"):
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


# redirect from old urls
def redirect(request, template_name="404.html"):
	# если кто-то хочет зайти на статью по старому url
	print request.path
	if request.path == u'/разрешение-на-строительство/':
		return redirect('/pages/razreshenie-na-stroitelstvo/')

	# return redirect('/404')
	# return render_to_response(template_name, locals(),context_instance=RequestContext(request))
