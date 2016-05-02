# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-02-27 23:03
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0009_auto_20160225_1153'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='account',
            name='role',
        ),
        migrations.AlterField(
            model_name='customerprofile',
            name='account',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='customer_of_account', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='performerprofile',
            name='account',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='performer_of_account', to=settings.AUTH_USER_MODEL),
        ),
    ]
