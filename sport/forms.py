from django.contrib.auth.models import User
from sport.models import Event
from django import forms


class UserForm(forms.ModelForm):
	password = forms.CharField(widget=forms.PasswordInput())

	class Meta:
		model = User
		fields = ('username', 'email', 'password')

class EventregForm(forms.ModelForm):
	datetime = forms.DateTimeField(widget=forms.DateTimeInput())
	class Meta:
		model = Event
		fields = ('mode', 'name', 'datetime')