# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models
from mptt.models import MPTTModel, TreeForeignKey


"""Абстрактный базовый класс для моделей"""
class BaseModel(models.Model):
	class Meta:
		abstract = True

	name             = models.CharField(u'Название',
														max_length=50,
														unique=False)
	slug             = models.SlugField(max_length=50,
														unique=True,
														help_text=u'Ссылка формируется автоматически при заполнении.')
	meta_title       = models.CharField(verbose_name=u'Мета title',
														max_length=80,
														blank=True)
	meta_description = models.CharField(verbose_name=u'Мета описание',
														max_length=255,
														help_text=u'Нужно для СЕО',
														blank=True)
	meta_keywords    = models.CharField(verbose_name=u'Мета ключевые слова',
														max_length=255,
														blank=True)
	created_at       = models.DateTimeField(verbose_name=u'Дата создания',
														null=True,
														auto_now_add=True)
	updated_at       = models.DateTimeField(verbose_name=u'Дата обновления',
														null=True,
														auto_now=True)

	def __unicode__(self):
		return self.name


"""Абстрактный базовый класс для информационных моделей"""
class BaseInfoModel(BaseModel):
	class Meta:
		abstract = True

	text             = RichTextUploadingField()


"""Абстрактный базовый класс для информационных моделей"""
class BaseInfoExtendedModel(BaseModel):
	class Meta:
		abstract = True

	text             = RichTextUploadingField()
	preview_name     = models.CharField(u'preview название(заголовок)',
														max_length=50,
														unique=False)
	preview_text     = models.TextField(verbose_name=u"preview описание")


""" Модель услуги """
class Service(BaseInfoExtendedModel):
	icon             = models.CharField(max_length=200,
														verbose_name=u"Иконка для услуги")
	image            = models.ImageField(upload_to="services")
	is_home          = models.BooleanField(default=False,
														verbose_name=u"Вывод в блок 4 услуги на главной")
	is_main          = models.BooleanField(default=False,
														verbose_name=u"Вывод в блок 'Новая услуга'")

	class Meta:
		verbose_name = u"Услуга"
		verbose_name_plural = u"Услуги"

	def get_url(self):
		return "/services/%s" % self.slug

	def get_absolute_url(self):
		return "/services/%s" % self.slug

	def get_image_url(self):
		return "/media/%s" % self.image


""" модель страницы """
class Page(BaseInfoExtendedModel):
	icon             = models.CharField(max_length=200,
														verbose_name=u"Иконка для страницы")

	class Meta:
		verbose_name = u"Страница"
		verbose_name_plural = u"Страницы"

	def get_url(self):
		return "/pages/%s/" %  self.slug

	def get_absolute_url(self):
		return "/pages/%s/" %  self.slug


""" модель статьи """
class Post(BaseInfoExtendedModel):
	icon             = models.CharField(max_length=200,
														verbose_name=u"Иконка для статьи",
														help_text=u'пример: <i class="icon-our-service icon-house_sell"></i>')
	image            = models.ImageField(upload_to="posts")

	class Meta:
		verbose_name = u"Статья"
		verbose_name_plural = u"Статьи"

	def get_url(self):
		return "/posts/%s" % self.slug

	def get_absolute_url(self):
		return "/posts/%s" % self.slug

	def get_image_url(self):
		return "/media/%s" % self.image


""" модель отзыва """
class Review(BaseInfoModel):
	position   = models.CharField(u'Род деятельности',
											max_length=50,
											unique=False)
	photo      = models.ImageField(null=True,
											blank=True,
											upload_to="reviews",
											verbose_name=u"Фото клиента")

	class Meta:
		verbose_name = u"Отзыв"
		verbose_name_plural = u"Отзывы"

	def get_photo_url(self):
		return "/media/%s" % self.photo

	def get_url(self):
		return "/reviews/%s" % self.id


""" модлель партнера """
class Partner(models.Model):
	name = models.CharField(u'Название компании',
								max_length=50,
								unique=False)

	logo = models.ImageField(null=True,
								blank=True,
								upload_to="partners",
								verbose_name=u"логотип компании")

	class Meta:
		verbose_name = u"Партнер"
		verbose_name_plural = u"Партнеты"

	def __unicode__(self):
		return self.name

	def get_logo_url(self):
		return "/media/%s" % self.logo
