# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from image_cropping import ImageRatioField
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from mptt.models import MPTTModel, TreeForeignKey

from core.models import Category


class Project(models.Model):
	category    = models.ForeignKey(Category)
	name       = models.CharField(max_length=100,
					verbose_name=u'Название проекта')
	slug       = models.SlugField(verbose_name=u'Ссылка на проект',
					max_length=50, 
					unique=True, 
					help_text=u'Ссылка формируется автоматически при заполнении.')

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
