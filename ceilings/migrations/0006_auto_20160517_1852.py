# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-05-17 18:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ceilings', '0005_auto_20160514_2133'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ceiling',
            name='preview_text',
            field=models.TextField(),
        ),
    ]
