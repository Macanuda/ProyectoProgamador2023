from rest_framework import serializers
from django.contrib.auth import get_user_model, authenticate
from django.contrib.auth.hashers import make_password
from .models import Producto, CustomUser

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True)
    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True, min_length=8)

    class Meta:
        model = get_user_model
        fields = ('email', 'username', 'password')

    def validate_password(self, value):
        return make_password(value)


class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'


class AuthTokenSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(style={'input_style' : 'password'})
    def validate(self, data):
        email = data.get('email')
        password = data.get('password')
        user = authenticate(
            request = self.context.get('request'),
            email = email,
            password = password,
        )
        if not user:
            raise serializers.ValidationError('No se pudo autenticar')
        data['user'] = user
        return data
