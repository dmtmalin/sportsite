from django.contrib import admin
from sport.models import Venue, Type, UsersGroup

admin.site.register(Type)
admin.site.register(UsersGroup)
admin.site.register(Venue)
# Register your models here.
