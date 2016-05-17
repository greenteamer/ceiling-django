# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-05-14 20:10
from __future__ import unicode_literals

import ckeditor_uploader.fields
from django.db import migrations, models
import django.db.models.deletion
import django.db.models.manager
import mptt.fields


class Migration(migrations.Migration):

    dependencies = [
        ('ceilings', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0431\u0440\u0435\u043d\u0434')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d\u043e')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u043e')),
                ('lft', models.PositiveIntegerField(db_index=True, editable=False)),
                ('rght', models.PositiveIntegerField(db_index=True, editable=False)),
                ('tree_id', models.PositiveIntegerField(db_index=True, editable=False)),
                ('level', models.PositiveIntegerField(db_index=True, editable=False)),
                ('parent', mptt.fields.TreeForeignKey(blank=True, help_text='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0431\u0440\u0435\u043d\u0434 \u0434\u043b\u044f \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0431\u0440\u0435\u043d\u0434\u0430', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='ceilings.Brand', verbose_name='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0431\u0440\u0435\u043d\u0434')),
            ],
            options={
                'ordering': ['created_at'],
                'verbose_name': '\u0411\u0440\u0435\u043d\u0434',
                'verbose_name_plural': '\u0411\u0440\u0435\u043d\u0434\u044b',
            },
            managers=[
                ('_default_manager', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='Texture',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0444\u0430\u043a\u0442\u0443\u0440\u0443')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d\u0430')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0430')),
                ('lft', models.PositiveIntegerField(db_index=True, editable=False)),
                ('rght', models.PositiveIntegerField(db_index=True, editable=False)),
                ('tree_id', models.PositiveIntegerField(db_index=True, editable=False)),
                ('level', models.PositiveIntegerField(db_index=True, editable=False)),
                ('parent', mptt.fields.TreeForeignKey(blank=True, help_text='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0430\u044f \u0444\u0430\u043a\u0442\u0443\u0440\u0430 \u0434\u043b\u044f \u0442\u0435\u043a\u0443\u0449\u0435\u0439 \u0444\u0430\u043a\u0442\u0443\u0440\u044b', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='ceilings.Texture', verbose_name='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0430\u044f \u0444\u0430\u043a\u0442\u0443\u0440\u0430')),
            ],
            options={
                'ordering': ['created_at'],
                'verbose_name': '\u0424\u0430\u043a\u0442\u0443\u0440\u0430',
                'verbose_name_plural': '\u0424\u0430\u043a\u0442\u0443\u0440\u044b',
            },
            managers=[
                ('_default_manager', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='Type',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0442\u0438\u043f')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d\u043e')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u043e')),
                ('lft', models.PositiveIntegerField(db_index=True, editable=False)),
                ('rght', models.PositiveIntegerField(db_index=True, editable=False)),
                ('tree_id', models.PositiveIntegerField(db_index=True, editable=False)),
                ('level', models.PositiveIntegerField(db_index=True, editable=False)),
                ('parent', mptt.fields.TreeForeignKey(blank=True, help_text='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0442\u0438\u043f \u0434\u043b\u044f \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0442\u0438\u043f\u0430', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='ceilings.Type', verbose_name='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0442\u0438\u043f')),
            ],
            options={
                'ordering': ['created_at'],
                'verbose_name': '\u0422\u0438\u043f \u043f\u043e\u0442\u043e\u043b\u043a\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043f\u043e\u0442\u043e\u043b\u043a\u043e\u0432',
            },
            managers=[
                ('_default_manager', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='Usage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435')),
                ('slug', models.SlugField(help_text='\u0421\u0441\u044b\u043b\u043a\u0430 \u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043f\u0440\u0438 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0438.', unique=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u0435')),
                ('text', ckeditor_uploader.fields.RichTextUploadingField()),
                ('meta_keywords', models.CharField(blank=True, max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043a\u043b\u044e\u0447\u0435\u0432\u044b\u0435 \u0441\u043b\u043e\u0432\u0430')),
                ('meta_description', models.CharField(blank=True, help_text='\u041d\u0443\u0436\u043d\u043e \u0434\u043b\u044f \u0421\u0415\u041e', max_length=255, verbose_name='\u041c\u0435\u0442\u0430 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d\u043e')),
                ('updated_at', models.DateTimeField(auto_now=True, null=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u043e')),
                ('lft', models.PositiveIntegerField(db_index=True, editable=False)),
                ('rght', models.PositiveIntegerField(db_index=True, editable=False)),
                ('tree_id', models.PositiveIntegerField(db_index=True, editable=False)),
                ('level', models.PositiveIntegerField(db_index=True, editable=False)),
                ('parent', mptt.fields.TreeForeignKey(blank=True, help_text='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0442\u0438\u043f \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u0434\u043b\u044f \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='ceilings.Usage', verbose_name='\u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0439 \u0442\u0438\u043f \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u044f')),
            ],
            options={
                'ordering': ['created_at'],
                'verbose_name': '\u041e\u0431\u043b\u0430\u0441\u0442\u044c \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u044f',
                'verbose_name_plural': '\u041e\u0431\u043b\u0430\u0441\u0442\u0438 \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u044f',
            },
            managers=[
                ('_default_manager', django.db.models.manager.Manager()),
            ],
        ),
        migrations.RemoveField(
            model_name='ceiling',
            name='category',
        ),
        migrations.AddField(
            model_name='ceiling',
            name='brand',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ceilings.Brand', verbose_name='\u0411\u0440\u0435\u043d\u0434 \u043f\u043e\u0442\u043e\u043b\u043a\u0430'),
        ),
        migrations.AddField(
            model_name='ceiling',
            name='texture',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ceilings.Texture', verbose_name='\u0424\u0430\u043a\u0442\u0443\u0440\u0430 \u043f\u043e\u0442\u043e\u043b\u043a\u0430'),
        ),
        migrations.AddField(
            model_name='ceiling',
            name='type',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ceilings.Type', verbose_name='\u0422\u0438\u043f \u043f\u043e\u0442\u043e\u043b\u043a\u0430'),
        ),
        migrations.AddField(
            model_name='ceiling',
            name='usage',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ceilings.Usage', verbose_name='\u0424\u0430\u043a\u0442\u0443\u0440\u0430 \u043f\u043e\u0442\u043e\u043b\u043a\u0430'),
        ),
    ]