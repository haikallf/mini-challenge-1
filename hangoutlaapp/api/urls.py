# from .views import RegisterAPI, LoginAPI
from knox import views as knox_views
from django.urls import path, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register('account', views.UsersViewSet)
router.register('schedule', views.SchedulehViewSet)
router.register('schedulemember', views.ScheduleMemberViewSet)
router.register('userlocation', views.UserLocationViewSet)
# router.register('login', LoginAPI)

urlpatterns = [
    # path('register/', RegisterAPI.as_view(), name='register'),
    # path('login/', LoginAPI.as_view(), name='login'),
    # path('logout/', knox_views.LogoutView.as_view(), name='logout'),
    # path('logoutall/', knox_views.LogoutAllView.as_view(), name='logoutall'),
    path('users/', views.UsersViewSet.as_view({'get': 'list'})),
    path('', include(router.urls)),
]