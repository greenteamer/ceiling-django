# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models
from mptt.models import MPTTModel, TreeForeignKey

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


class Service(models.Model):
    name = models.CharField(u'Название',
                            max_length=50,
                            unique=False)

    slug = models.SlugField(verbose_name=u'Ссылка на услугу',
                            max_length=50,
                            unique=True,
                            help_text=u'Ссылка формируется автоматически при заполнении.')

    icon = models.CharField(max_length=200,
                            verbose_name=u"Иконка для услуги")

    image = models.ImageField(upload_to="services")

    text = RichTextUploadingField()

    is_home = models.BooleanField(default=False,
                                  verbose_name=u"Вывод в блок 4 услуги на главной")

    is_main = models.BooleanField(default=False,
                                  verbose_name=u"Вывод в блок 'Новая услуга'")

    meta_title = models.CharField(verbose_name=u'Мета title',
                        max_length=80,
                        blank=True)

    meta_keywords = models.CharField(verbose_name=u'Мета ключевые слова',
                                     max_length=255,
                                     blank=True)

    meta_description = models.CharField(verbose_name=u'Мета описание',
                                        max_length=255,
                                        help_text=u'Нужно для СЕО',
                                        blank=True)

    created_at = models.DateTimeField(verbose_name=u'Создана',
                                      null=True,
                                      auto_now_add=True)

    updated_at = models.DateTimeField(verbose_name=u'Обновлена',
                                      null=True,
                                      auto_now=True)

    class Meta:
        verbose_name = u"Услуга"
        verbose_name_plural = u"Услуги"

    def __unicode__(self):
        return self.name

    def get_url(self):
        return "/services/%s" % self.slug

    def get_image_url(self):
        return "/media/%s" % self.image


class Page(models.Model):
    category         = models.ForeignKey(Category, 
                        verbose_name=u'Категория', 
                        null=True, 
                        blank=True)
    name             = models.CharField(u'Заголовок',
                        max_length=50,
                        unique=False)
    slug             = models.SlugField(verbose_name=u'Ссылка на страницу',
                        max_length=50,
                        unique=True,
                        help_text=u'Ссылка формируется автоматически при заполнении.')
    icon             = models.CharField(max_length=200,
                        verbose_name=u"Иконка для страницы")
    text             = RichTextUploadingField()
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
    created_at       = models.DateTimeField(verbose_name=u'Создана',
                        null=True,
                        auto_now_add=True)
    updated_at       = models.DateTimeField(verbose_name=u'Обновлена',
                        null=True,
                        auto_now=True)

    class Meta:
        verbose_name = u"Страница"
        verbose_name_plural = u"Страницы"

    def __unicode__(self):
        return self.name

    def get_url(self):
        return "/pages/%s" % self.slug


class Post(models.Model):
    name = models.CharField(u'Название',
                            max_length=50,
                            unique=False)

    slug = models.SlugField(verbose_name=u'Ссылка на статью',
                            max_length=50,
                            unique=True,
                            help_text=u'Ссылка формируется автоматически при заполнении.')

    icon = models.CharField(max_length=200,
                            verbose_name=u"Иконка для статьи",
                            help_text=u'пример: <i class="icon-our-service icon-house_sell"></i>')

    image = models.ImageField(upload_to="services")

    text = RichTextUploadingField()

    meta_title = models.CharField(verbose_name=u'Мета title',
                        max_length=80,
                        blank=True)

    meta_keywords = models.CharField(verbose_name=u'Мета ключевые слова',
                                     max_length=255,
                                     blank=True)

    meta_description = models.CharField(verbose_name=u'Мета описание',
                                        max_length=255,
                                        help_text=u'Нужно для СЕО',
                                        blank=True)

    created_at = models.DateTimeField(verbose_name=u'Создана',
                                      null=True,
                                      auto_now_add=True)

    updated_at = models.DateTimeField(verbose_name=u'Обновлена',
                                      null=True,
                                      auto_now=True)

    class Meta:
        verbose_name = u"Статья"
        verbose_name_plural = u"Статьи"

    def __unicode__(self):
        return self.name

    def get_url(self):
        return "/posts/%s" % self.slug

    def get_image_url(self):
        return "/media/%s" % self.image


class Review(models.Model):
    name = models.CharField(u'Имя',
                            max_length=50,
                            unique=False)

    position = models.CharField(u'Род деятельности',
                                max_length=50,
                                unique=False)

    photo = models.ImageField(null=True,
                              blank=True,
                              upload_to="reviews",
                              verbose_name=u"Фото клиента")

    text = models.TextField(verbose_name=u"Отзывы клиента")

    created_at = models.DateTimeField(verbose_name=u'Создана',
                                      null=True,
                                      auto_now_add=True)

    updated_at = models.DateTimeField(verbose_name=u'Обновлена',
                                      null=True,
                                      auto_now=True)

    class Meta:
        verbose_name = u"Отзыв"
        verbose_name_plural = u"Отзывы"

    def __unicode__(self):
        return "%s - %s" % (self.name, self.position)

    def get_photo_url(self):
        return "/media/%s" % self.photo

    def get_url(self):
        return "/reviews/%s" % self.id


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


class Notes(models.Model):
    title = models.CharField(max_length=100)
    text = models.TextField()

    def __unicode__(self):
        return self.title
