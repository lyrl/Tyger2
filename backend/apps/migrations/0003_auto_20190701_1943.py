# Generated by Django 2.1.5 on 2019-07-01 18:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apps', '0002_auto_20190204_1138'),
    ]

    operations = [
        migrations.AlterField(
            model_name='app',
            name='url',
            field=models.CharField(max_length=255),
        ),
    ]
