# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('city_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('latitude', models.FloatField()),
                ('longitude', models.FloatField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('event_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('datetime', models.DateTimeField(db_index=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('group_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('show', models.CharField(db_index=True, max_length=50)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Mode',
            fields=[
                ('mode_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('show', models.CharField(db_index=True, max_length=50)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('photo_id', models.AutoField(serialize=False, primary_key=True)),
                ('photo', models.BinaryField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Sport',
            fields=[
                ('sport_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('show', models.CharField(db_index=True, max_length=50)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('status_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('show', models.CharField(db_index=True, max_length=50)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserEvent',
            fields=[
                ('user_event_id', models.AutoField(serialize=False, primary_key=True)),
                ('event', models.ForeignKey(to='sport.Event')),
                ('status', models.ForeignKey(to='sport.Status')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserGroup',
            fields=[
                ('user_group_id', models.AutoField(serialize=False, primary_key=True)),
                ('group', models.ForeignKey(to='sport.Group')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Venue',
            fields=[
                ('venue_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(db_index=True, max_length=50)),
                ('latitude', models.FloatField(db_index=True)),
                ('longitude', models.FloatField(db_index=True)),
                ('city', models.ForeignKey(to='sport.City')),
                ('group', models.ForeignKey(to='sport.Group')),
                ('sport', models.ForeignKey(to='sport.Sport')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='VenueEvent',
            fields=[
                ('venue_event_id', models.AutoField(serialize=False, primary_key=True)),
                ('event', models.ForeignKey(to='sport.Event')),
                ('venue', models.ForeignKey(to='sport.Venue')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='photo',
            name='venue',
            field=models.ForeignKey(to='sport.Venue'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='mode',
            field=models.ForeignKey(to='sport.Mode'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='root_user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='status',
            field=models.ForeignKey(to='sport.Status'),
            preserve_default=True,
        ),
    ]
