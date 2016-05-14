# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from mptt.models import MPTTModel, TreeForeignKey


class FilterType(models.Model):
	name 	           = models.CharField(max_length=100,
														verbose_name=u'Название типа фильтра')
	slug 	           = models.SlugField(verbose_name=u'slug типа фильтра',
														max_length=50,
														unique=True,
														help_text=u'Ссылка формируется автоматически при заполнении.')
	text             = RichTextUploadingField(blank=True,
	                          null=True)
	meta_keywords    = models.CharField(verbose_name=u'Мета ключевые слова',
														max_length=255,
														blank=True)
	meta_description = models.CharField(verbose_name=u'Мета описание',
														max_length=255,
														help_text=u'Нужно для СЕО',
														blank=True)
	created_at       = models.DateTimeField(verbose_name=u'Создан',
														null=True,
														auto_now_add=True)
	updated_at       = models.DateTimeField(verbose_name=u'Обновлен',
														null=True,
														auto_now=True)

	class Meta:
		verbose_name        = u"Тип фильтра потолков"
		verbose_name_plural = u"Типы фильтров"

	def __unicode__(self):
		return self.name
	def get_url(self):
		return "/natyazhnye-potolki/filter-type/%s/" % self.slug


class Filter(MPTTModel):
	type 						 = models.ForeignKey(FilterType,
	                          verbose_name=u'тип фильтра')
	name             = models.CharField(u'Название',
														max_length=50,
														unique=False)
	slug             = models.SlugField(verbose_name=u'slug фильтра',
														max_length=50,
														unique=True,
														help_text=u'Ссылка формируется автоматически при заполнении.')
	text             = RichTextUploadingField(blank=True,
	                          null=True)
	meta_keywords    = models.CharField(verbose_name=u'Мета ключевые слова',
														max_length=255,
														blank=True)
	meta_description = models.CharField(verbose_name=u'Мета описание',
														max_length=255,
														help_text=u'Нужно для СЕО',
														blank=True)
	created_at       = models.DateTimeField(verbose_name=u'Создан',
														null=True,
														auto_now_add=True)
	updated_at       = models.DateTimeField(verbose_name=u'Обновлен',
														null=True,
														auto_now=True)
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
		return "/natyazhnye-potolki/filter/%s/" % self.slug


class Ceiling(models.Model):
	filter					 = models.ManyToManyField(Filter,
														blank=True)
	name             = models.CharField(u'Заголовок',
														max_length=50,
														unique=False)
	slug             = models.SlugField(verbose_name=u'Ссылка на страницу',
														max_length=50,
														unique=True,
														help_text=u'Ссылка формируется автоматически при заполнении.')
	text             = RichTextUploadingField()
	preview_name     = models.CharField(u'preview Заголовок',
														max_length=50,
														unique=False)
	preview_text     = RichTextUploadingField()

	meta_title       = models.CharField(verbose_name=u'Мета title',
														max_length=80,
														blank=True)
	meta_keywords    = models.CharField(verbose_name=u'Мета ключевые слова',
														max_length=255,
														blank=True)
	meta_description = models.CharField(verbose_name=u'Мета описание',
														max_length=255,
														help_text=u'Нужно для СЕО',
														blank=True)
	image 					 = models.ImageField(verbose_name=u'Изображение',
														upload_to="ceilings")
	created_at       = models.DateTimeField(verbose_name=u'Создана',
														null=True,
														auto_now_add=True)
	updated_at       = models.DateTimeField(verbose_name=u'Обновлена',
														null=True,
														auto_now=True)

	class Meta:
		verbose_name = u"Потолок"
		verbose_name_plural = u"Потолки"

	def __unicode__(self):
		return self.name

	def get_url(self):
		return "/natyazhnye-potolki/%s/" %  self.slug
