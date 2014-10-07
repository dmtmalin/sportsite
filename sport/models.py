from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Mode(models.Model):
	mode_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

class Status(models.Model):
	status_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

class Group(models.Model):
	group_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

class Sport(models.Model):
	sport_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

class Event(models.Model):
	event_id = models.AutoField(primary_key=True)
	root_user = models.ForeignKey(User)
	mode = models.ForeignKey(Mode)
	status = models.ForeignKey(Status)
	name = models.CharField(max_length=50, db_index=True)
	datetime = models.DateTimeField(db_index = True)

class UserEvent(models.Model):
	user_event_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(User)
	event = models.ForeignKey(Event)
	status = models.ForeignKey(Status)

class City(models.Model):
	city_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	latitude = models.FloatField()
	longitude = models.FloatField()

class Venue(models.Model):
	venue_id = models.AutoField(primary_key=True)
	city = models.ForeignKey(City)
	sport = models.ForeignKey(Sport)
	group = models.ForeignKey(Group)
	name = models.CharField(max_length=50, db_index=True)
	latitude = models.FloatField(db_index=True)
	longitude = models.FloatField(db_index=True)

class UserGroup(models.Model):
	user_group_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(User)
	group = models.ForeignKey(Group)

class Photo(models.Model):
	photo_id = models.AutoField(primary_key=True)
	venue = models.ForeignKey(Venue)
	photo = models.BinaryField()