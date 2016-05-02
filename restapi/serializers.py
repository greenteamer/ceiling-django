# -*- coding: utf-8 -*-
from rest_framework import serializers
from authentication.models import Account, PerformerProfile, CustomerProfile


class PerformerProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = PerformerProfile
        fields = ('id', 'first_name', 'last_name', 'phone')


class CustomerProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomerProfile
        fields = ('id', 'first_name', 'last_name', 'phone')


class AccountSerializer(serializers.ModelSerializer):
    performer_of_account = PerformerProfileSerializer(many=False, read_only=True)
    customer_of_account = CustomerProfileSerializer(many=False, read_only=True)
    class Meta:
        model = Account
        fields = ('id', 'username', 'performer_of_account', 'customer_of_account')

