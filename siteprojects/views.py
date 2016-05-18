from django.shortcuts import render, render_to_response
from django.template import RequestContext


from siteprojects.models import Project, ProjectImage


def project_item(request, slug, template_name="siteprojects/project_item.html"):
	project = Project.objects.get(slug=slug)
	performer_profile = project.account.performer_of_account
	featured_projects = Project.objects.filter(featured=True)
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))


def project_list(request, template_name="siteprojects/project_list.html"):
	projects = Project.objects.all()
	filters = set()
	for project in projects:
		project_filters = project.filter.all()
		filters.update(project_filters)
	return render_to_response(template_name, locals(), context_instance=RequestContext(request))
