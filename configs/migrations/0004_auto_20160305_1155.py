# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-03-05 11:55
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('configs', '0003_auto_20160218_0645'),
    ]

    operations = [
        migrations.CreateModel(
            name='SitePhone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('site_phone', models.CharField(help_text=b'\xd0\xb2\xd0\xb2\xd0\xbe\xd0\xb4\xd0\xb8\xd1\x82\xd0\xb5 \xd1\x82\xd0\xb5\xd0\xbb\xd0\xb5\xd1\x84\xd0\xbe\xd0\xbd \xd0\xb2 \xd1\x84\xd0\xbe\xd1\x80\xd0\xbc\xd0\xb0\xd1\x82\xd0\xb5 8 (118) 716-20-19', max_length=200, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d \u0441\u0430\u0439\u0442\u0430')),
                ('is_main', models.BooleanField(default=True, verbose_name='\u0413\u043b\u0430\u0432\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d')),
            ],
            options={
                'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d \u0441\u0430\u0439\u0442\u0430',
                'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u044b \u0441\u0430\u0439\u0442\u0430',
            },
        ),
        migrations.RemoveField(
            model_name='config',
            name='site_phone',
        ),
        migrations.AddField(
            model_name='sitephone',
            name='config',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='configs.Config'),
        ),
    ]
