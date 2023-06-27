from rest_framework import serializers
from django.contrib.auth import get_user_model, authenticate
from django.contrib.auth.hashers import make_password
from .models import Producto, CustomUser, Veterinaria



class UserSerializer(serializers.ModelSerializer):
    # password = serializers.CharField(max_length=150)

    class Meta:
        model = CustomUser
        fields=('id','email', 'username')

    def validate_password(self, value):
        return make_password(value)
    

class SignUpSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id','email','username' , 'password')
        extra_kwargs = {'password':{'write_only':True}}

    def create(self, validated_data):
        user = CustomUser.objects.create_user(validated_data['username'], validated_data['email'], validated_data['password'])

        return user

class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'


class VeterinariaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Veterinaria
        fields = ('nombre_veterinaria', 'email', 'pais', 'provincia', 'localidad', 'calle', 'numero')


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
