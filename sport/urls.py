from django.conf.urls import patterns, url
from sport import views

urlpatterns = patterns('',
    url(r'^$', views.types, name='types'),
    url(r'^map', views.map, name='map'),
    url(r'^venues', views.venues, name='venues')
)