# -*- coding: utf-8 -*-
from django.shortcuts import redirect, render_to_response
from django.template import RequestContext
from configs.forms import ContactForm
from django.views.generic.edit import FormView
from siteprojects.models import Project
from core.models import Service, Post, Review, Partner, Page, Category
from configs.methods import get_site_config


def home(request, template_name="core/home.html"):
	# подготовка плока из ч видов потолков
	cat = Category.objects.get(slug='faktura')
	categories = cat.get_children()
	pages = []
	for c in categories:
		try: 
			p = Page.objects.get(category=c)
			p.split_name = p.name.split(" ")
			pages.append(p)
		except Exception: 
			pass
	last_page = Page.objects.get(slug='mnogourovnevye-natyazhnye-potolki')
	last_page.split_name = last_page.name.split(" ")
	pages.append(last_page)
	print pages[:4]

	about_page = Page.objects.get(slug='o-nas')

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
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def service_item(request, slug, template_name="core/service_item.html"):
	print "request::::: %s" % request.GET
	service = Service.objects.get(slug=slug)

	title = ""
	if service.meta_title:
		title = service.meta_title
	else: 
		title = service.name
	description = service.meta_description

	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def page_item(request, slug, template_name="core/page_item.html"):
	page = Page.objects.get(slug=slug)

	title = ""
	if page.meta_title:
		title = page.meta_title
	else: 
		title = page.name
	description = page.meta_description
	
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def post_item(request, slug, template_name="core/post_item.html"):
	post = Post.objects.get(slug=slug)

	title = ""
	if post.meta_title:
		title = post.meta_title
	else: 
		title = post.name
	description = post.meta_description
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def post_list(request, template_name="core/post_list.html"):
	posts = Post.objects.all()

	title = u"Статьи"
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
