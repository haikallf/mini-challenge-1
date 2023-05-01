# from rest_framework import generics, permissions, viewsets
# from rest_framework.response import Response
# from rest_framework.authtoken.serializers import AuthTokenSerializer
# from knox.models import AuthToken
# from .serializers import UserSerializer, RegisterSerializer
# from knox.views import LoginView as KnoxLoginView
# from . import serializers
# from . import models
# from django.contrib.auth.models import User

# from django.contrib.auth import login
# # Register API
# class RegisterAPI(generics.GenericAPIView):
#     serializer_class = RegisterSerializer

#     def post(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         user = serializer.save()
#         return Response({
#         "user": UserSerializer(user, context=self.get_serializer_context()).data,
#         "token": AuthToken.objects.create(user)[1]
#         })
    
# class LoginAPI(KnoxLoginView):
#     permission_classes = (permissions.AllowAny,)

#     def post(self, request, format=None):
#         serializer = AuthTokenSerializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         user = serializer.validated_data['user']
#         login(request, user)
#         return super(LoginAPI, self).post(request, format=None)
    
# class UsersViewSet(viewsets.ModelViewSet):

#     serializer_class = serializers.UserSerializer
#     queryset = User.objects.all()

from django.shortcuts import render
from rest_framework import viewsets, permissions
from account import models as account_models
from . import serializers
from . import models
from rest_framework.views import APIView
from rest_framework.response import Response



# Create your views here.

class UsersViewSet(viewsets.ModelViewSet):

    serializer_class = serializers.CustomUserSerializers
    queryset = account_models.CustomUser.objects.all()

    # def get_queryset(self):
    #     if self.request.user.role != 'User':
    #         return account_models.CustomUser.objects.all().order_by('-created_at')
    #     else:
    #         return account_models.CustomUser.objects.none()

class SchedulehViewSet(viewsets.ModelViewSet):

    serializer_class = serializers.ScheduleSerializers
    queryset = models.Schedule.objects.all()

class ScheduleMemberViewSet(viewsets.ModelViewSet):

    serializer_class = serializers.ScheduleMemberSerializers
    queryset = models.ScheduleMember.objects.all()

class UserLocationViewSet(viewsets.ModelViewSet):

    serializer_class = serializers.UserLocationSerializers
    queryset = models.UserLocation.objects.all()