from django.contrib import admin
from ceilings.models import *


class CeilingAdmin(admin.ModelAdmin):
    model = Ceiling
    filter_horizontal = ('filter',)
    prepopulated_fields = {'slug': ('name',), }


class FilterTypeAdmin(admin.ModelAdmin):
    model = FilterType
    prepopulated_fields = {'slug': ('name', ), }


class FilterAdmin(admin.ModelAdmin):
    model = Filter
    prepopulated_fields = {'slug': ('name', ), }


admin.site.register(Ceiling, CeilingAdmin)
admin.site.register(FilterType, FilterTypeAdmin)
admin.site.register(Filter, FilterAdmin)
