import json
from sport import queries
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def types(request):    
    types = queries.types_get('SP')
    context = {'types': types}
    return render(request, 'types.html', context)

def map(request):
    request.session['sport_type_id'] = request.GET.get('sport_type_id', 0);
    return render(request, 'map.html')

def venues(request):    
    venues = queries.venues_get(request.session.get('sport_type_id', 0), 
        request.GET.get('lat', 0.0),
        request.GET.get('lng', 0.0))
    return HttpResponse(json.dumps(venues), content_type="application/json")