#-*- coding: utf-8 -*-
from django.contrib import admin
from django import forms
from siteprojects.models import Project, ProjectImage
from image_cropping import ImageCroppingMixin
from ckeditor.widgets import CKEditorWidget


class ProjectImageInline(ImageCroppingMixin, admin.StackedInline):
    model = ProjectImage
    extra = 1


# class AmenitiesInline(admin.StackedInline):
#     model = Amenities
#     extra = 1


class ProjectAdmin(admin.ModelAdmin):
    model = Project
    # fieldsets = [
    #     (u'Основная информация', {'fields':['name','slug','body']}),
        # (u'Специальная информация', {
        #     'fields': ['special_image','special_body']}),
    # ]
    prepopulated_fields = {'slug': ('name', ), }
    filter_horizontal = ('filter',)
    inlines = [ProjectImageInline, ]

admin.site.register(Project, ProjectAdmin)
