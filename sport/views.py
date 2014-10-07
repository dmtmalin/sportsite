from django.shortcuts import render
from django.template import RequestContext
from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth import logout, authenticate, login
from django.http import HttpResponse, HttpResponseRedirect
from sport.forms import UserForm
from sport.models import City, Sport, Venue

# Create your views here.
def home(request):
	sports = Sport.objects.all(
		).values('sport_id', 'show'
		).order_by('-show')

	cities = City.objects.all(
		).values('city_id', 'name'
		).order_by('-name')

	city_id = request.session.get('city_id', 0)
	if city_id == '':
		city_id = '0'	
	context = { 'sports': sports, 'cities': cities,  'city_id': city_id }
	return render(request, 'home.html', context);

def city(request):
	request.session['city_id'] = request.GET.get('city_id', 0) 
	return HttpResponse('')

def map(request):	
	city = City.objects.filter(city_id = request.session.get('city_id', 0)
		).values('latitude', 'longitude')[:1]

	venues = Venue.objects.select_related(
		).filter(city_id = request.session.get('city_id', 0)
		).filter(sport_id = request.GET.get('sport_id', 0)
		).values('venue_id', 'name', 'latitude', 'longitude')
	
	context = { 'city': city[0], 'venues': venues }	
	return render(request, 'sport/map.html', context)

def logout_view(request):
	logout(request);
	return redirect('home');

def login_view(request):
	context = RequestContext(request)

	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']

		user = authenticate(username=username, password=password)

		if user is not None:
			if user.is_active:
				login(request, user)
				return HttpResponseRedirect('/sport/')
			else:
				return HttpResponse("Your account is disabled.")
		else:
			print("Invalid login details:{0}, {1}", username, password)
			return HttpResponse("Invalid login details supplied")
	else:
		return render_to_response('login.html', {}, context)

def register(request):
	context = RequestContext(request)

	registered = False

	if request.method == 'POST':
		user_form = UserForm(data=request.POST)

		if user_form.is_valid():
			user = user_form.save()
			user.set_password(user.password)
			user.save()
			registered = True
		else:
			print(user_form.errors)
	else:
		user_form = UserForm()

	return render_to_response('register.html', {'user_form': user_form, 'registered': registered}, context)