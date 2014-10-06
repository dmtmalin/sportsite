from django.conf.urls import patterns, url
from sport import views

urlpatterns = patterns('',
    url(r'^$', views.home, name='home'),
    url(r'^login/$', views.login_view, name='login'),
    url(r'^logout_view', views.logout_view, name='logout_view'),
    url(r'^register/$', views.register, name='register'),  
    url(r'^city', views.city, name='city'), 
    url(r'^map', views.map, name='map'),
    url(r'^events/$', views.events, name='events'),
    url(r'^regvenues/$', views.regvenues, name='regvenues'),
    url(r'^regvenues/regevent', views.regevent, name='regevent'),
)