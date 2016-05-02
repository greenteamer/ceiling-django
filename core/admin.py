from django.contrib import admin
from core.models import Service, Post, Page, Review, Partner, Notes


class ServiceAdmin(admin.ModelAdmin):
    model = Service
    prepopulated_fields = {'slug': ('name',), }


class PostAdmin(admin.ModelAdmin):
    model = Post
    prepopulated_fields = {'slug': ('name',), }


class PageAdmin(admin.ModelAdmin):
    model = Page
    prepopulated_fields = {'slug': ('name',), }

    class Media:
        js = ('admin/js/admin.js',)

admin.site.register(Service, ServiceAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(Page, PageAdmin)
admin.site.register(Review)
admin.site.register(Partner)
admin.site.register(Notes)
