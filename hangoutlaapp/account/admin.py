from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import CustomUser
from import_export.admin import ImportExportModelAdmin

class UserAdmin(BaseUserAdmin, ImportExportModelAdmin):
    fieldsets = (
        (None, {'fields': (
            'created_at', 'email', 'password', 'fullname', 'phone', 'role',  'photo'
            )
        }),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields':(
                'created_at', 'email', 'fullname', 'phone', 'role', 'photo', 'password1', 'password2',
            )
        }),
    )
    list_display = ['created_at', 'email', 'fullname','role']
    search_fields = ['email', 'fullname', 'role']
    ordering = ['created_at', 'role', 'email']

admin.site.site_header = "HANGOUTLA ADMIN"
admin.site.register(CustomUser, UserAdmin)
