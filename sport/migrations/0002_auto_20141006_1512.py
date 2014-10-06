# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


def populate_city(apps, schema_editor):
	City = apps.get_model("sport", "City")
	c = City(name="Москва", latitude=55.754334, longitude=37.618169)
	c.save()
	c = City(name="Пенза", latitude=53.203539, longitude=45.011828)
	c.save()

def populate_group(apps, schema_editor):
	Group = apps.get_model("sport", "Group")
	g = Group(show="Общая", name="Common")
	g.save()

def populate_mode(apps, schema_editor):
	Mode = apps.get_model("sport", "Mode")
	m = Mode(show="Публичный", name="Public")
	m.save()
	m = Mode(show="Приватный", name="Private")
	m.save()

def populate_sport(apps, schema_editor):
	Sport = apps.get_model("sport", "Sport")
	s = Sport(show="Бадмитон", name="Badminton")
	s.save()
	s = Sport(show="Баскетбол", name="Basketball")
	s.save()
	s = Sport(show="Волейбол", name="Volleyball")
	s.save()
	s = Sport(show="Теннис", name="Tennis")
	s.save()
	s = Sport(show="Футбол", name="Football")
	s.save()
	s = Sport(show="Хоккей", name="Hockey")
	s.save()

def populate_status(apps, schema_editor):
	Status = apps.get_model("sport", "Status")
	s = Status(show="Активный", name="Active")
	s.save()
	s = Status(show="Отмененный", name="Cancel")
	s.save()
	s = Status(show="В ожидании", name="Wait")
	s.save()

class Migration(migrations.Migration):

    dependencies = [
        ('sport', '0001_initial'),
    ]

    operations = [
    	migrations.RunPython(populate_city),
    	migrations.RunPython(populate_group),
    	migrations.RunPython(populate_mode),
    	migrations.RunPython(populate_sport),
    	migrations.RunPython(populate_status),
    ]
