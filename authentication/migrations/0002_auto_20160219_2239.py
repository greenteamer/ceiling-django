# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-02-19 22:39
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='is_student',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='account',
            name='is_teacher',
            field=models.BooleanField(default=False),
        ),
    ]
