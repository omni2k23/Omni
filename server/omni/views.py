from django.http import JsonResponse
from .models import Driver, Deliveries

def pastDeliveries(request, driver_id):
    """Use case 5: allow drivers to see thier past deliveries."""
    past_deliveries = list(Deliveries.objects.filter(driver_id__exact=driver_id))

    # Render the HTML template index.html with the data in the context variable
    return JsonResponse(data=past_deliveries, safe=False)