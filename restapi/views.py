# -*- coding: utf-8 -*-
from rest_framework import viewsets
from rest_framework.views import APIView
from restapi.serializers import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, list_route
from rest_framework.response import Response

from authentication.models import Account


class AccountsViewSet(viewsets.ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer

    @list_route()
    def current_user(self, request, **kwargs):
        """тестовый метод вызывается через /api/accounts/current_user/ ...
        тез каких либо дополнительных записей в urls"""
        self.queryset = Account.objects.filter(id=request.user.id)
        serializer = AccountSerializer(instance=self.queryset, many=True)
        return Response(serializer.data)


