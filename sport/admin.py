from django.contrib import admin
from sport.models import Event, Mode, Status

# Register your models here.
admin.site.register(Event)
admin.site.register(Mode)
admin.site.register(Status)