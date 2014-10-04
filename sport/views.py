import json
from sport import queries
from sport.models import City
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def types(request):    
    types = queries.types_get('SP')
    cities = City.objects.all().values('city_id', 'name').order_by('-name')
    city_id = request.session.get('city_id', 0)
    print type(city_id)
    context = { 'curr_city_id': int(city_id), 'cities': cities,  'types': types }
    return render(request, 'sport/types.html', context)

def map(request):
    request.session['sport_type_id'] = request.GET.get('sport_type_id', 0);
    city = City.objects.filter(city_id = request.session.get('city_id', 0)).values('latitude_degree', 'longitude_degree')[:1]
    context = { 'city': city[0] }
    print context
    return render(request, 'sport/map.html', context)

def venues(request):    
    venues = queries.venues_get(request.session.get('sport_type_id', 0), 
        request.GET.get('lat', 0.0),
        request.GET.get('lng', 0.0))
    return HttpResponse(json.dumps(venues), content_type="application/json")

def events(request):    
    events = queries.events_get(request.GET.get('venue_id', 0))    
    return HttpResponse(json.dumps(events), content_type="application/json")

def city(request):
    request.session['city_id'] = request.GET.get('city_id', 0)   
    return HttpResponse('')