from django.conf.urls import url, include
from siteprojects.views import project_item, project_list


urlpatterns = [
    # url(r'^$', views.home, name='home'),
    # url(r'^$', ContactFormView.as_view(), name="home"),
    url(r'projects/(?P<slug>[-\w]+)/$', project_item, name="project_item"),
    url(r'projects/$', project_list, name="project_list"),
]
