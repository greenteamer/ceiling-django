# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-10 12:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('siteprojects', '0009_amenities'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='amenities',
            name='checked',
        ),
        migrations.RemoveField(
            model_name='amenities',
            name='project',
        ),
        migrations.AddField(
            model_name='project',
            name='amenities',
            field=models.ManyToManyField(to='siteprojects.Amenities'),
        ),
        migrations.AlterField(
            model_name='amenities',
            name='name',
            field=models.CharField(max_length=100, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0443\u0434\u043e\u0431\u0441\u0442\u0432\u0430'),
        ),
    ]
