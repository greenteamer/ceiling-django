# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-05-14 21:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ceilings', '0004_auto_20160514_2120'),
    ]

    operations = [
        migrations.AlterField(
            model_name='filtertype',
            name='name',
            field=models.CharField(max_length=100, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0442\u0438\u043f\u0430 \u0444\u0438\u043b\u044c\u0442\u0440\u0430'),
        ),
    ]