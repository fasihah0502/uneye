from django.db import models

# Create your models here.

class Customer(models.Model):
	name = models.CharField(max_length=200, null=True)
	phone = models.CharField(max_length=200, null=True)
	email = models.CharField(max_length=200, null=True)
	date_created = models.DateTimeField(auto_now_add=True, null=True, blank=True)

	def __str__(self):
		return self.name

	@property
	def orders(self):
		order_count = self.order_set.all().count()
		return str(order_count)
