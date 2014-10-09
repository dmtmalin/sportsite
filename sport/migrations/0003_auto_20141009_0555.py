# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.contrib.auth.models import User

def populate_users(apps, schema_editor):
	u = User(username="test", password="test")
	u.set_password(u.password)
	u.save()

def populate_venues(apps, schema_editor):
	Venue = apps.get_model("sport", "Venue")
	City = apps.get_model("sport", "City")
	Sport = apps.get_model("sport", "Sport")
	Group = apps.get_model("sport", "Group")
	c1 = City.objects.get(name__iexact="Москва")
	c2 = City.objects.get(name__iexact="Пенза")
	g = Group.objects.get(name__iexact="Common")
	s = Sport.objects.get(name__iexact="Badminton")
	v = Venue(city=c1, sport=s, group=g, name="Бадминтон пл.1", latitude=55.754324, longitude=37.618179)
	v.save()
	v = Venue(city=c1, sport=s, group=g, name="Бадминтон пл.2", latitude=55.754314, longitude=37.618159)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Бадминтон пл.1", latitude=53.203529, longitude=45.011838)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Бадминтон пл.2", latitude=53.203519, longitude=45.011818)
	v.save()
	s = Sport.objects.get(name__iexact="Basketball")
	v = Venue(city=c1, sport=s, group=g, name="Баcкетбол пл.1", latitude=55.754344, longitude=37.618172)
	v.save()
	v = Venue(city=c1, sport=s, group=g, name="Баcкетбол пл.2", latitude=55.754354, longitude=37.618162)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Баcкетбол пл.1", latitude=53.203549, longitude=45.011858)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Баcкетбол пл.2", latitude=53.203559, longitude=45.011826)
	v.save()
	s = Sport.objects.get(name__iexact="Volleyball")
	v = Venue(city=c1, sport=s, group=g, name="Волейбол пл.1", latitude=55.754322, longitude=37.618175)
	v.save()
	v = Venue(city=c1, sport=s, group=g, name="Волейбол пл.2", latitude=55.754310, longitude=37.618155)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Волейбол пл.1", latitude=53.203526, longitude=45.011832)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Волейбол пл.2", latitude=53.203516, longitude=45.011812)
	v.save()
	s = Sport.objects.get(name__iexact="Tennis")
	v = Venue(city=c1, sport=s, group=g, name="Теннис пл.1", latitude=55.754320, longitude=37.618115)
	v.save()
	v = Venue(city=c1, sport=s, group=g, name="Теннис пл.2", latitude=55.754316, longitude=37.618110)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Теннис пл.1", latitude=53.203533, longitude=45.011815)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Теннис пл.2", latitude=53.203512, longitude=45.011810)
	v.save()
	s = Sport.objects.get(name__iexact="Football")
	v = Venue(city=c1, sport=s, group=g, name="Футбол пл.1", latitude=55.754345, longitude=37.618123)
	v.save()
	v = Venue(city=c1, sport=s, group=g, name="Футбол пл.2", latitude=55.754317, longitude=37.618136)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Футбол пл.1", latitude=53.203547, longitude=45.011823)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Футбол пл.2", latitude=53.203509, longitude=45.011836)
	v.save()
	s = Sport.objects.get(name__iexact="Hockey")
	v = Venue(city=c1, sport=s, group=g, name="Хоккей пл.1", latitude=55.754332, longitude=37.618145)
	v.save()
	v = Venue(city=c1, sport=s, group=g, name="Хоккей пл.2", latitude=55.754305, longitude=37.618132)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Хоккей пл.1", latitude=53.203556, longitude=45.011845)
	v.save()
	v = Venue(city=c2, sport=s, group=g, name="Хоккей пл.2", latitude=53.203511, longitude=45.011832)
	v.save()
	
def populate_events(apps, schema_editor):
	Event = apps.get_model("sport", "Event")
	VenueEvent = apps.get_model("sport", "VenueEvent")
	Venue = apps.get_model("sport", "Venue")
	Mode = apps.get_model("sport", "Mode")
	Status = apps.get_model("sport", "Status")
	City = apps.get_model("sport", "City")
	m = Mode.objects.get(name__iexact="Public")
	s = Status.objects.get(name__iexact="Active")
	u = User.objects.get(username__iexact="test")
	c1 = City.objects.get(name__iexact="Москва")
	v = Venue.objects.get(name__iexact="Бадминтон пл.1",city=c1)
	e = Event(mode=m, status=s, name="Москва Бадминтон 1", datetime="2014-10-10 13:30")
	e.root_user_id = u.id
	e.save()
	ve = VenueEvent(venue=v, event=e)
	ve.save()
	e = Event(mode=m, status=s, name="Москва Бадминтон 2", datetime="2014-10-13 09:30")
	e.root_user_id = u.id
	e.save()
	ve = VenueEvent(venue=v, event=e)
	ve.save()
	v = Venue.objects.get(name__iexact="Бадминтон пл.2",city=c1)
	e = Event(mode=m, status=s, name="Москва Бадминтон 3", datetime="2014-11-10 13:30")
	e.root_user_id = u.id
	e.save()
	ve = VenueEvent(venue=v, event=e)
	ve.save()


class Migration(migrations.Migration):

    dependencies = [
        ('sport', '0002_auto_20141006_1512'),
    ]

    operations = [
    	migrations.RunPython(populate_users),
    	migrations.RunPython(populate_venues),
    	migrations.RunPython(populate_events),
    ]
