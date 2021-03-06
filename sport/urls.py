from django.conf.urls import patterns, url
from sport import views

urlpatterns = patterns('',
    url(r'^$', views.home, name='home'),
    url(r'^login/$', views.login_view, name='login'),
    url(r'^logout_view', views.logout_view, name='logout_view'),
    url(r'^register/$', views.register, name='register'),  
    url(r'^city', views.city, name='city'), 
    url(r'^map/$', views.map, name='map'),   
    url(r'^map/register', views.map_register, name='map_register'),
    url(r'^events/$', views.events, name='events'),
    url(r'^venues/$', views.venues, name='venues'),
    url(r'^venues/register', views.venues_register, name='venues_register'),
    url(r'^requests/$', views.requests, name='requests'),
    url(r'^requests/register', views.requests_register, name='requests_register')   
)