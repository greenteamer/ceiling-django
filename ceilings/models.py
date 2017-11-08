# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from core.models import BaseModel, BaseInfoModel, BaseInfoExtendedModel
from ckeditor_uploader.fields import RichTextUploadingField
from mptt.models import MPTTModel, TreeForeignKey
from image_cropping import ImageRatioField


class FilterType(BaseInfoModel):
	class Meta:
		verbose_name        = u"Тип фильтра потолков"
		verbose_name_plural = u"Типы фильтров"

	def get_url(self):
		return "/natyazhnye-potolki/filter-type/%s/" % self.slug

	def get_filters(self):
		return Filter.objects.filter(type=self)


class Filter(MPTTModel, BaseInfoModel):
	type 						 = models.ForeignKey(FilterType,
														verbose_name=u'тип фильтра')
	parent           = TreeForeignKey('self',
														verbose_name=u'Родительская фильтр',
														related_name='children',
														blank=True,
														help_text=u'Родительский фильтр для текущего',
														null=True)

	class Meta:
		ordering = ['created_at']
		verbose_name = u'Фильтр'
		verbose_name_plural = u'Фильтры'

	def __unicode__(self):
		try:
			return "%s-%s" % ('--' * self.level, self.parent.name, self.name)
		except:
			return '%s%s' % ('--' * self.level, self.name)

	def get_url(self):
		return "/natyazhnye-potolki/filters/%s/" % self.slug

	def get_absolute_url(self):
		return "/natyazhnye-potolki/filters/%s/" % self.slug

	def split_name(self):
		return self.name.split(" ")

	def get_advantages(self):
		return FilterAdvantages.objects.filter(filter=self)


class FilterAdvantages(models.Model):
	filter = models.ForeignKey(Filter,
									verbose_name=u'Фильтр к которому принадлежит преимущество')
	name   = models.CharField(u'Название преимущества',
									max_length=50,
									unique=False)

	def __unicode__(self):
		return self.name


class FilterManager(models.Manager):
	def by_filter_type(self, filter_type):
		# фильтруем натяжные потолки по типу фильтра
		# сначала достаем все фильтры этого типа
		# и добавляем все потолки отфильтрованные по каждому фильтру в set
		# функция возвращает список [list]
		ceilings = set()
		filter_list = Filter.objects.filter(type=filter_type)
		for filter in filter_list:
			c_list = filter.ceiling_set.all()
			ceilings.update(set(c_list))
		return list(ceilings)

	def by_filter_slug(self, filter_slug):
		# фильтруем натяжные потолки по slug фильтра
		# функция возвращает [list]
		filter = Filter.objects.get(slug=filter_slug)
		return filter.ceiling_set.all()


class Ceiling(BaseInfoExtendedModel):
	filter					 = models.ManyToManyField(Filter,
														blank=True)
	price						 = models.CharField(verbose_name=u'Цена за м²',
	                         max_length=50, unique=False, blank=True, null=True )
	image 					 = models.ImageField(verbose_name=u'Изображение',
														upload_to="ceilings",blank=True, null=True)

	objects = models.Manager()
	filter_objects = FilterManager()

	class Meta:
		verbose_name = u"Потолок"
		verbose_name_plural = u"Потолки"

	def get_url(self):
		return "/natyazhnye-potolki/ceilings/%s/" %  self.slug

	def get_absolute_url(self):
		return "/natyazhnye-potolki/ceilings/%s/" %  self.slug

	def get_image_url(self):
		return "/media/%s" %  self.image

	def split_name(self):
		return self.name.split(" ")

	def get_all_images(self):
		return CeilingImage.objects.filter(ceiling=self)


class CeilingImage(models.Model):
	ceiling          = models.ForeignKey(Ceiling,
						verbose_name=u'Выбрать потолок',
						related_name='images')
	image            = models.ImageField(verbose_name=u'Изображение',
						upload_to='ceilings/',
						help_text=u'Изображение',
						blank=True)
	cropping         = ImageRatioField('image',
						'500x320',
						verbose_name=u'Обрезка 500x320')
	cropping_250x375 = ImageRatioField('image',
						'250x375',
						verbose_name=u'Обрезка 250x375')
	cropping_750x455 = ImageRatioField('image',
						'750x455',
						verbose_name=u'Обрезка  750x455')

	def get_url(self):
		if self.image and self.image != '':
			return "/media/%s" % self.image
		else:
			return '/static/images/none_image.png'
	def get_url_750x455(self):
		if self.image and self.image != '':
			return "/media/%s" % self.cropping_750x455
		else:
			return '/static/images/none_image.png'
	def get_url_250x375(self):
		if self.image and self.image != '':
			return "/media/%s" % self.cropping_250x375
		else:
			return '/static/images/none_image.png'
