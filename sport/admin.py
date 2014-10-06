from django.contrib import admin
from sport.models import City, Venue, Type, UsersGroup

admin.site.register(City)
admin.site.register(Type)
admin.site.register(UsersGroup)
admin.site.register(Venue)
# Register your models here.
