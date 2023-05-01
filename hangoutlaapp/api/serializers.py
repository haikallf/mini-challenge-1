# from rest_framework import serializers
# from django.contrib.auth.models import User

# # User Serializer
# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ('id', 'username', 'email')

# # Register Serializer
# class RegisterSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ('id', 'username', 'email', 'password')
#         extra_kwargs = {'password': {'write_only': True}}

#     def create(self, validated_data):
#         user = User.objects.create_user(validated_data['username'], validated_data['email'], validated_data['password'])

#         return user

from rest_framework import serializers
from account import models as account_models
from rest_framework.authtoken.models import Token
from . import models
import datetime

class CustomUserSerializers(serializers.ModelSerializer):
    password = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = account_models.CustomUser
        fields = ['email', 'fullname', 'phone', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = account_models.CustomUser(
            email=validated_data['email'],
            fullname=validated_data['fullname'],
            phone=validated_data['phone'],
        )
        user.set_password(validated_data['password'])
        user.save()

        return user
    
class UserSerializers(serializers.ModelSerializer):

    class Meta:
        model = account_models.CustomUser
        fields = ['fullname', 'email']

class ScheduleSerializers(serializers.ModelSerializer):
    user_id = UserSerializers(source='user', read_only=True)

    class Meta:
        model = models.Schedule
        fields = '__all__'

class ScheduleMemberSerializers(serializers.ModelSerializer):

    class Meta:
        model = models.ScheduleMember
        fields = '__all__'

class UserLocationSerializers(serializers.ModelSerializer):

    class Meta:
        model = models.UserLocation
        fields = '__all__'