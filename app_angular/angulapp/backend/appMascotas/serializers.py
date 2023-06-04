from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True)
    username = serializers.CharField(required=True)
    password = serializers.EmailField(required=True, min_length=8)

    class Meta:
        model = get_user_model()
        fields = ('email','username','password')

def validate_pass(self, value):
    return make_password(value)