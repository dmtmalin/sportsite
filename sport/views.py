import json
from sport import queries
from django.shortcuts import render, redirect, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import logout, authenticate, login
from sport.forms import UserForm
from django.template import RequestContext

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

def home(request):
	return render(request, 'home.html');

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


