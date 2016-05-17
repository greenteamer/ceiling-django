# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-05-14 21:14
from __future__ import unicode_literals

import ckeditor_uploader.fields
from django.db import migrations, models
import django.db.models.deletion
import django.db.models.manager
import mptt.fields


class Migration(migrations.Migration):

    dependencies = [
        ('ceilings', '0002_auto_20160514_2010'),
    ]

    operations = [
        migrations.CreateModel(
            name='Filter',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='slug \u0444\u0438\u043b\u044c\u0442\u0440\u0430')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d')),
                ('lft', models.PositiveIntegerField(db_index=True, editable=False)),
                ('rght', models.PositiveIntegerField(db_index=True, editable=False)),
                ('tree_id', models.PositiveIntegerField(db_index=True, editable=False)),
                ('level', models.PositiveIntegerField(db_index=True, editable=False)),
                ('parent', mptt.fields.TreeForeignKey(blank=True, help_text='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0444\u0438\u043b\u044c\u0442\u0440 \u0434\u043b\u044f \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='ceilings.Filter', verbose_name='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0430\u044f \u0444\u0438\u043b\u044c\u0442\u0440')),
            ],
            options={
                'ordering': ['created_at'],
                'verbose_name': '\u0424\u0438\u043b\u044c\u0442\u0440',
                'verbose_name_plural': '\u0424\u0438\u043b\u044c\u0442\u0440\u044b',
            },
            managers=[
                ('_default_manager', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='FilterType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0443\u0434\u043e\u0431\u0441\u0442\u0432\u0430')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='slug \u0442\u0438\u043f\u0430 \u0444\u0438\u043b\u044c\u0442\u0440\u0430')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0444\u0438\u043b\u044c\u0442\u0440\u0430 \u043f\u043e\u0442\u043e\u043b\u043a\u043e\u0432',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0444\u0438\u043b\u044c\u0442\u0440\u043e\u0432',
            },
        ),
        migrations.RemoveField(
            model_name='brand',
            name='parent',
        ),
        migrations.RemoveField(
            model_name='texture',
            name='parent',
        ),
        migrations.RemoveField(
            model_name='type',
            name='parent',
        ),
        migrations.RemoveField(
            model_name='usage',
            name='parent',
        ),
        migrations.RemoveField(
            model_name='ceiling',
            name='brand',
        ),
        migrations.RemoveField(
            model_name='ceiling',
            name='texture',
        ),
        migrations.RemoveField(
            model_name='ceiling',
            name='type',
        ),
        migrations.RemoveField(
            model_name='ceiling',
            name='usage',
        ),
        migrations.DeleteModel(
            name='Brand',
        ),
        migrations.DeleteModel(
            name='Texture',
        ),
        migrations.DeleteModel(
            name='Type',
        ),
        migrations.DeleteModel(
            name='Usage',
        ),
        migrations.AddField(
            model_name='filter',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ceilings.FilterType', verbose_name='\u0442\u0438\u043f \u0444\u0438\u043b\u044c\u0442\u0440\u0430'),
        ),
        migrations.AddField(
            model_name='ceiling',
            name='filter',
            field=models.ManyToManyField(blank=True, to='ceilings.Filter'),
        ),
    ]