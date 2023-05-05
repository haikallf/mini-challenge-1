from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.utils import timezone

class CustomUserManager(BaseUserManager):
    def _create_user(self, email, fullname, phone, password,
    **extra_fields):

        if not email:
            raise ValueError('The given username must be set')

        email = self.normalize_email(email)
        user = self.model(  email=email,
                            fullname=fullname,
                            phone=phone,
                            **extra_fields)
        user.set_password(password)
        user.save(using=self.db)

        return user

    def create_user(self,  email, fullname, phone, password=None, **extra_fields):
        return self._create_user(email, fullname, phone, password, **extra_fields)

    def create_superuser(self, email, fullname, phone, password=None, **extra_fields):
        return self._create_user(email, fullname, phone, password,  **extra_fields)


class CustomUser(AbstractBaseUser, PermissionsMixin):
    created_at = models.DateTimeField(default=timezone.now)
    email = models.EmailField(max_length=255, unique=True)
    fullname = models.CharField(max_length=255, default='')
    phone = models.CharField(max_length=20, default='')
    ROLES = (
        ("Admin", "Admin"),
        ("User", "User"),
    )
    role = models.CharField(max_length=100, choices=ROLES, default='User')
    photo = models.FileField(upload_to='user/photo/', blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=True) # <--- yang bisa akses django admin
    is_superuser = models.BooleanField(default=True) # <--- yang bisa akses django admin

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['fullname', 'phone']

    objects = CustomUserManager()

    def save(self, *args, **kwargs):
        self.email = self.email.lower()
        return super().save(*args, **kwargs)

    def __str__(self):
        return '{} / {}'.format(self.email, self.fullname)
