from django.contrib import admin
from sport.models import Venue, Event, UserEvent, UserGroup

# Register your models here.
admin.site.register(Event)
admin.site.register(UserEvent)
admin.site.register(Venue)
admin.site.register(UserGroup)