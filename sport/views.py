from datetime import datetime
from django.shortcuts import render
from django.template import RequestContext
from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth import logout, authenticate, login
from django.http import HttpResponse, HttpResponseRedirect
from sport.forms import UserForm, EventregForm
from sport.models import City, Sport, Venue, UserEvent, Event, UserGroup, Group, Status, VenueEvent

# Create your views here.
def home(request):
	sports = Sport.objects.all(
		).values('sport_id', 'show'
		).order_by('show')

	cities = City.objects.all(
		).values('city_id', 'name'
		).order_by('name')

	city_id = request.session.get('city_id', 0)
	if city_id == '':
		city_id = '0'	
	context = { 'sports': sports, 'cities': cities,  'city_id': int(city_id) }
	return render(request, 'sport/home.html', context);

def city(request):
	request.session['city_id'] = request.GET.get('city_id', 0) 
	return HttpResponse('')

def map(request):	
	city = City.objects.filter(city_id = request.session.get('city_id', 0)
		).values('latitude', 'longitude')[:1]

	venues = Venue.objects.filter(city_id = request.session.get('city_id', 0)
		).filter(sport_id = request.GET.get('sport_id', 0)
		).values('venue_id', 'name', 'latitude', 'longitude')
	
	context = { 'city': city[0], 'venues': venues }	
	return render(request, 'sport/map.html', context)

def events(request):
	events = Event.objects.select_related(
		).filter(userevent__user_id = request.user.id
		).order_by('-datetime')
	context = { 'events': events }
	return render(request, 'sport/events.html', context)

def venues(request):
	venues = Venue.objects.filter(city_id = request.session.get('city_id', 0)
		).filter(group_id__in = UserGroup.objects.filter(user_id = request.user.id
			).values_list('group_id', flat=True)
		).order_by('name')
	context = { 'venues': venues }
	return render(request, 'sport/venues.html', context)

def venues_register(request):
	context = RequestContext(request)

	registered = False	

	if request.method == 'POST':
		register_form = EventregForm(data=request.POST)

		if register_form.is_valid():
			active_status_id = Status.objects.get(name__iexact='active'
				).status_id
			ev = Event(
				root_user_id = request.user.id,
				mode_id = register_form.data['mode'],
				status_id = active_status_id,
				name = register_form.cleaned_data['name'],
				datetime = register_form.cleaned_data['datetime'])			
			ev.save()

			v_ev = VenueEvent(
				venue_id = request.session.get('venue_id', 0),
				event_id = ev.event_id)	
			v_ev.save()	

			u_ev = UserEvent(
				user_id = request.user.id,
				event_id = ev.event_id,
				status_id = active_status_id)
			u_ev.save()

			registered = True
		else:
			print(register_form.errors)
	else:
		request.session['venue_id'] = request.GET.get('venue_id', 0)
		register_form = EventregForm()

	return render_to_response('sport/venuesregister.html', { 'register_form': register_form, 'registered': registered }, context)

def map_events(request):	
	events = Event.objects.select_related(
		).filter(venueevent__venue_id = request.GET.get('venue_id', 0)
		).filter(status__name__iexact = 'active'
		).filter(datetime__gt = datetime.today()
		).order_by('-datetime')
	context =  { 'events' : events }
	return render(request, 'sport/mapevents.html', context)

def map_register(request):	
	v_event_id = request.GET.get('event_id', 0)

	v_status_id = 0
	status_name = ''

	if UserEvent.objects.filter(user_id = request.user.id).filter(event_id = v_event_id).exists():
		status_name = 'exists'
	else:
		event = Event.objects.get(event_id = v_event_id)

		if event.mode.name == 'Public':
			status_name = 'active'
			v_status_id = Status.objects.get(name__iexact='active'
					).status_id
		else:
			status_name = 'wait'
			v_status_id = Status.objects.get(name__iexact='wait'
					).status_id

		u_ev = UserEvent(
			user_id = request.user.id,
			event_id = v_event_id,
			status_id = v_status_id)
		u_ev.save()

	context = { 'status': status_name }

	return render(request, 'sport/mapregister.html', context)

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
		return render_to_response('sport/login.html', {}, context)

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

			#добавление группы по умолчанию "Общая"
			common_group_id = Group.objects.get(name__iexact='common'
				).group_id
			gr = UserGroup(user_id = user.id, group_id = common_group_id)
			gr.save()
		else:
			print(user_form.errors)
	else:
		user_form = UserForm()

	return render_to_response('sport/register.html', {'user_form': user_form, 'registered': registered}, context)
