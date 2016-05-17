# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-05-17 21:24
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import image_cropping.fields


class Migration(migrations.Migration):

    dependencies = [
        ('ceilings', '0007_ceiling_price'),
    ]

    operations = [
        migrations.CreateModel(
            name='CeilingImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, help_text='\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435', upload_to='ceilings/', verbose_name='\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435')),
                ('cropping', image_cropping.fields.ImageRatioField('image', '500x320', adapt_rotation=False, allow_fullsize=False, free_crop=False, help_text=None, hide_image_field=False, size_warning=False, verbose_name='\u041e\u0431\u0440\u0435\u0437\u043a\u0430 500x320')),
                ('cropping_250x375', image_cropping.fields.ImageRatioField('image', '250x375', adapt_rotation=False, allow_fullsize=False, free_crop=False, help_text=None, hide_image_field=False, size_warning=False, verbose_name='\u041e\u0431\u0440\u0435\u0437\u043a\u0430 250x375')),
                ('cropping_750x455', image_cropping.fields.ImageRatioField('image', '750x455', adapt_rotation=False, allow_fullsize=False, free_crop=False, help_text=None, hide_image_field=False, size_warning=False, verbose_name='\u041e\u0431\u0440\u0435\u0437\u043a\u0430  750x455')),
                ('ceiling', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='ceilings.Ceiling', verbose_name='\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u043f\u043e\u0442\u043e\u043b\u043e\u043a')),
            ],
        ),
    ]
