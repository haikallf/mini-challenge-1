from django.db import models
from account import models as account_models
from account.models import CustomUser
import datetime

# Create your models here.

class Schedule(models.Model):
    LISTSTATUS = (
        ('Created', 'Created'),
        ('Ongoing', 'Ongoing'),
        ('Success', 'Success'),
        ('Cancel', 'Cancel'),
    )
    created_at = models.DateTimeField(default=datetime.datetime.now)
    nama = models.CharField(max_length=255, blank=True, null=True)
    user = models.ForeignKey(account_models.CustomUser, on_delete=models.CASCADE, blank=True, null=True)
    latitude = models.CharField(max_length=255, blank=True, null=True)
    longitude = models.CharField(max_length=255, blank=True, null=True)
    alamat = models.TextField(blank=True, null=True)
    namatempat = models.CharField(max_length=255, blank=True, null=True)
    tanggal = models.DateField(default=datetime.datetime.now)
    waktu = models.TimeField(auto_now=False, auto_now_add=False, default=datetime.datetime.now)

    def __str__(self) -> str:
      return '{}'.format(self.nama)
    
class ScheduleMember(models.Model):
   created_at = models.DateTimeField(default=datetime.datetime.now)
   schedule_id = models.ForeignKey(Schedule, on_delete=models.CASCADE, blank=True, null=True)
   member = models.ForeignKey(account_models.CustomUser, on_delete=models.CASCADE, blank=True, null=True)
   
   def __str__(self) -> str:
      return '({}) {}'.format(self.schedule_id, self.member)

class UserLocation(models.Model):
   reated_at = models.DateTimeField(default=datetime.datetime.now)
   user = models.ForeignKey(account_models.CustomUser, on_delete=models.CASCADE, blank=True, null=True)
   latitude = models.CharField(max_length=255, blank=True, null=True)
   longitude = models.CharField(max_length=255, blank=True, null=True)

   def __str__(self):
        return '{}'.format(self.nama)