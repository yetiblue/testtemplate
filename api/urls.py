from django.contrib import admin
from django.urls import include, path
from rest_framework import routers

from accounts.views import CurrentUserViewSet

router = routers.SimpleRouter()
router.register(r"user", CurrentUserViewSet)

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/v2/auth/", include("djoser.urls")),
    path("api/v2/auth/", include("djoser.urls.authtoken")),
    path("api/v2/", include(router.urls)),
]
