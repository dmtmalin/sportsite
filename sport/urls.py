from django.conf.urls import patterns, url
from sport import views

urlpatterns = patterns('',
	url(r'^$', views.home, name='home'),
    url(r'^sport', views.types, name='types'),
    url(r'^map', views.map, name='map'),
    url(r'^venues', views.venues, name='venues'),
    url(r'^logout_view', views.logout_view, name='logout_view'),
    url(r'^register/$', views.register, name='register'),
    url(r'^login/$', views.login_view, name='login'),

)