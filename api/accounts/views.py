from rest_framework.viewsets import ModelViewSet

from accounts.serializers import UserSerializer
from accounts.models import User


class CurrentUserViewSet(ModelViewSet):
    model = User
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

    def list(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)
