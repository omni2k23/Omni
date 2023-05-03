from django.contrib import admin
from .models import Customer, Order, Driver, Delivery

# Register your models here.
admin.site.register(Customer)
admin.site.register(Order)
admin.site.register(Driver)
admin.site.register(Delivery)
