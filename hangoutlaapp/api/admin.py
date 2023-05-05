from django.contrib import admin
from . import models
from import_export.admin import ImportExportModelAdmin

# Register your models here.

class ScheduleAdmin(ImportExportModelAdmin):
  pass

class ScheduleMemberAdmin(ImportExportModelAdmin):
  pass

class UserLocationAdmin(ImportExportModelAdmin):
  pass

class SchedulePhotosAdmin(ImportExportModelAdmin):
  pass

admin.site.register(models.Schedule, ScheduleAdmin)
admin.site.register(models.ScheduleMember, ScheduleMemberAdmin)
admin.site.register(models.UserLocation, UserLocationAdmin)
admin.site.register(models.SchedulePhotos, SchedulePhotosAdmin)