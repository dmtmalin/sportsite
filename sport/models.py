from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Mode(models.Model):
	mode_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

	def __str__(self):
		return self.show

class Status(models.Model):
	status_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

	def __str__(self):
		return self.show

class Group(models.Model):
	group_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

	def __str__(self):
		return self.show

class Sport(models.Model):
	sport_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	show = models.CharField(max_length=50, db_index=True)

	def __str__(self):
		return self.show

class Event(models.Model):
	event_id = models.AutoField(primary_key=True)
	root_user = models.ForeignKey(User)
	mode = models.ForeignKey(Mode)
	status = models.ForeignKey(Status)
	name = models.CharField(max_length=50, db_index=True)
	datetime = models.DateTimeField(db_index = True)

	def __str__(self):
		return self.name

class UserEvent(models.Model):
	user_event_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(User)
	event = models.ForeignKey(Event)
	status = models.ForeignKey(Status)

	def __str__(self):
		user = User.objects.filter(id=self.user_id).values('username')[:1][0].get('username', None)
		event = Event.objects.filter(event_id = self.event_id).values('name')[:1][0].get('name', None)
		return  "%s - %s" % (user, event)

class City(models.Model):
	city_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50, db_index=True)
	latitude = models.FloatField()
	longitude = models.FloatField()

	def __str__(self):
		return self.name

class Venue(models.Model):
	venue_id = models.AutoField(primary_key=True)
	city = models.ForeignKey(City)
	sport = models.ForeignKey(Sport)
	group = models.ForeignKey(Group)
	name = models.CharField(max_length=50, db_index=True)
	latitude = models.FloatField(db_index=True)
	longitude = models.FloatField(db_index=True)

	def __str__(self):
		return self.name

class UserGroup(models.Model):
	user_group_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(User)
	group = models.ForeignKey(Group)

	def __str__(self):
		user = User.objects.filter(id=self.user_id).values('username')[:1][0].get('username', None)
		group = Group.objects.filter(group_id = self.group_id).values('show')[:1][0].get('show', None)
		return  "%s - %s" % (user, group)

class Photo(models.Model):
	photo_id = models.AutoField(primary_key=True)
	venue = models.ForeignKey(Venue)
	photo = models.BinaryField()