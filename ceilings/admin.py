from django.contrib import admin
from image_cropping import ImageCroppingMixin
from ceilings.models import *


class CeilingImageInline(ImageCroppingMixin, admin.StackedInline):
	model = CeilingImage
	extra = 1

class CeilingAdmin(admin.ModelAdmin):
	model = Ceiling
	filter_horizontal = ('filter',)
	prepopulated_fields = {'slug': ('name',), }
	inlines = [CeilingImageInline, ]

class FilterTypeAdmin(admin.ModelAdmin):
	model = FilterType
	prepopulated_fields = {'slug': ('name', ), }

class FilterAdvantagesInline(admin.StackedInline):
	model = FilterAdvantages
	extra = 1

class FilterAdvantagesAdmin(admin.ModelAdmin):
	model = Filter
	prepopulated_fields = {'slug': ('name', ), }

class FilterAdmin(admin.ModelAdmin):
	model = Filter
	prepopulated_fields = {'slug': ('name', ), }
	inlines = [FilterAdvantagesInline, ]


admin.site.register(Ceiling, CeilingAdmin)
admin.site.register(FilterType, FilterTypeAdmin)
admin.site.register(Filter, FilterAdmin)
# admin.site.register(FilterAdvantages, FilterAdvantagesAdmin)
