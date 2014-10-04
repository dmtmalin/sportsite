from django.conf.urls import patterns, url
from sport import views

urlpatterns = patterns('',
    url(r'^$', views.types, name='types'),
    url(r'^map', views.map, name='map'),
    url(r'^city', views.city, name='map'),
    url(r'^venues', views.venues, name='venues'),
    url(r'^events', views.events, name='events')
)