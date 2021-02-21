# Generated by Django 3.1.6 on 2021-02-21 02:03

import authentication.models.users
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to=authentication.models.users._image_filename, verbose_name='profile image'),
        ),
        migrations.AddField(
            model_name='user',
            name='kth_id',
            field=models.CharField(blank=True, max_length=15, null=True, verbose_name='KTH-id'),
        ),
        migrations.AddField(
            model_name='user',
            name='language',
            field=models.CharField(choices=[('sv', 'Swedish'), ('en', 'English')], default='sv', max_length=2, verbose_name='language'),
        ),
        migrations.AddField(
            model_name='user',
            name='user_type',
            field=models.PositiveSmallIntegerField(blank=True, choices=[(1, 'Student'), (2, 'Senior'), (3, 'External'), (4, 'Admin')], null=True, verbose_name='user type'),
        ),
        migrations.AddField(
            model_name='user',
            name='year',
            field=models.CharField(blank=True, choices=[('F-20', 'F-20 Fotnot'), ('F-19', 'F-19 Fasett'), ('F-18', 'F-18 Flingsalt'), ('F-17', 'F-17 Förarlös'), ('F-16', 'F-16 Fuskbygge'), ('F-15', 'F-15 Fanclub'), ('F-14', 'F-14 Folkvett'), ('F-13', 'F-13 Frågvis?')], max_length=4, null=True, verbose_name='chapter year'),
        ),
    ]
