# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from image_cropping import ImageRatioField
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from mptt.models import MPTTModel, TreeForeignKey

from authentication.models import Account


class Category(MPTTModel):
	"""Класс для категорий проектов"""
	name             = models.CharField(u'Название',
						max_length=50, 
						unique=False)
	slug             = models.SlugField(verbose_name=u'Ссылка на категорию',
						max_length=50, 
						unique=True, 
						help_text=u'Ссылка формируется автоматически при заполнении.')
	text             = RichTextUploadingField()
	meta_keywords    = models.CharField(verbose_name=u'Мета ключевые слова',
						max_length=255, 
						blank=True)
	meta_description = models.CharField(verbose_name=u'Мета описание',
						max_length=255,
						help_text=u'Нужно для СЕО', 
						blank=True)
	created_at       = models.DateTimeField(verbose_name=u'Создана',
						null=True, 
						auto_now_add=True)
	updated_at       = models.DateTimeField(verbose_name=u'Обновлена',
						null=True, 
						auto_now=True)
	parent           = TreeForeignKey('self',
						verbose_name=u'Родительская категория', 
						related_name='children',
						blank=True, 
						help_text=u'Родительская категория для текущей категоири',
						null=True)

	class Meta:
		ordering = ['created_at']
		verbose_name_plural = u'Категории'

	def __unicode__(self):
		try:
			return "%s-%s" % ('--' * self.level, self.parent.name, self.name)
		except:
			return '%s%s' % ('--' * self.level, self.name)


class Amenities(models.Model):
	name = models.CharField(max_length=100,
				verbose_name=u'Название удобства')
	class Meta:
		verbose_name        = u"Удобство"
		verbose_name_plural = u"Удобства"
	def __unicode__(self):
		return self.name


class Project(models.Model):
	account    = models.ForeignKey(Account)
	category   = models.ForeignKey(Category)
	amenities  = models.ManyToManyField(Amenities, 
					blank=True)
	name       = models.CharField(max_length=100,
					verbose_name=u'Название проекта')
	address    = models.CharField(max_length=100,
					verbose_name=u'Адрес')
	slug       = models.SlugField(verbose_name=u'Ссылка на проект',
					max_length=50, 
					unique=True, 
					help_text=u'Ссылка формируется автоматически при заполнении.')
	text       = RichTextField()
	sku        = models.IntegerField(verbose_name=u'Артикул',
					null=True, 
					blank=True)
	for_sale   = models.BooleanField(default=False,
					verbose_name=u"на продажу")
	featured   = models.BooleanField(default=False,
					verbose_name=u"В интересное")
	square     = models.IntegerField(verbose_name=u'Площадь дома')
	badrooms   = models.IntegerField(verbose_name=u'Колличество спален')
	bathrooms  = models.IntegerField(verbose_name=u'Колличество ванных комнат')
	created_at = models.DateTimeField(u'Created at',
					null=True, 
					auto_now_add=True)
	updated_at = models.DateTimeField(u'Updated at',
					null=True, 
					auto_now=True)

	class Meta:
		verbose_name        = u"Проект"
		verbose_name_plural = u"Проекты"
	def __unicode__(self):
		return self.name
	def get_url(self):
		return "/projects/%s" % self.slug
	def get_image(self):
		return ProjectImage.objects.filter(project=self).first()
	def get_all_images(self):
		return ProjectImage.objects.filter(project=self)


class ProjectImage(models.Model):
	project          = models.ForeignKey(Project,
						verbose_name=u'Выбрать проект', 
						related_name='images')
	image            = models.ImageField(verbose_name=u'Изображение проекта',
						upload_to='projects/', 
						help_text=u'Изображение', 
						blank=True)
	cropping         = ImageRatioField('image',
						'500x320', 
						verbose_name=u'Обрезка для проекта 500x320')
	cropping_250x375 = ImageRatioField('image',
						'250x375', 
						verbose_name=u'Обрезка для проекта 250x375')
	cropping_750x455 = ImageRatioField('image',
						'750x455', 
						verbose_name=u'Обрезка для катрочки проекта 750x455')

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
