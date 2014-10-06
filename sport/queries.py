from django.db import connection, transaction

def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]

def types_get(object_string):
    cursor = connection.cursor()
    cursor.execute("""SELECT type_id, name FROM dbo.types_get(%s);""", (object_string, ))
    result = dictfetchall(cursor)
    return result

def venues_get(sport_type_id, lat, lng):
    cursor = connection.cursor()
    cursor.execute("""SELECT venue_id, name, latitude, longitude
        FROM dbo.venues_get(%s, %s, %s);""", (sport_type_id, lat, lng))
    result = dictfetchall(cursor)
    return result

def events_get(venue_id):
    cursor = connection.cursor()
    cursor.execute("""SELECT event_id, root_user, mode_type, name, date_time, user_count
        FROM dbo.events_get(%s);""", (venue_id, ))
    result = dictfetchall(cursor)
    return result