#-*- coding: utf-8 -*-
from django.contrib import admin
from django import forms
from siteprojects.models import Project, Category, ProjectImage, Amenities
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
    filter_horizontal = ('amenities',)
    inlines = [ProjectImageInline, ]

class CategoryAdmin(admin.ModelAdmin):
    model = Category
    prepopulated_fields = {'slug': ('name', ), }

admin.site.register(Category, CategoryAdmin)    
admin.site.register(Project, ProjectAdmin)
admin.site.register(Amenities)
