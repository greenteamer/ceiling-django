# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-03-07 22:37
from __future__ import unicode_literals

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0009_auto_20160307_2143'),
    ]

    operations = [
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443')),
                ('icon', models.CharField(max_length=200, verbose_name='\u0418\u043a\u043e\u043d\u043a\u0430 \u0434\u043b\u044f \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u044b')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d\u0430')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0430')),
            ],
            options={
                'verbose_name': '\u0421\u0442\u0430\u0442\u044c\u044f',
                'verbose_name_plural': '\u0421\u0442\u0430\u0442\u044c\u0438',
            },
        ),
        migrations.AlterField(
            model_name='post',
            name='icon',
            field=models.CharField(help_text='\u043f\u0440\u0438\u043c\u0435\u0440: <i class="icon-our-service icon-house_sell"></i>', max_length=200, verbose_name='\u0418\u043a\u043e\u043d\u043a\u0430 \u0434\u043b\u044f \u0441\u0442\u0430\u0442\u044c\u0438'),
        ),
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0441\u0442\u0430\u0442\u044c\u044e'),
        ),
        migrations.AlterField(
            model_name='service',
            name='icon',
            field=models.CharField(max_length=200, verbose_name='\u0418\u043a\u043e\u043d\u043a\u0430 \u0434\u043b\u044f \u0443\u0441\u043b\u0443\u0433\u0438'),
        ),
    ]
