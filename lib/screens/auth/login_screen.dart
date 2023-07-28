import 'package:final_project/routes/route_name.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isLoading = false;
  var _isPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();
  String? email, password;
  String? emailErrorMessage, passwordErrorMessage;

  Future<dynamic> _login() async {
    try {
      var result = await AuthService().login(email!, password!);
      if (result['isSuccess']) {
        setState(() {
          isLoading = true;
        });
        Get.snackbar(
          "Sukses",
          result['message'].toString(),
          backgroundColor: Colors.green[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
        Future.delayed(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.pageMain);
          setState(() {
            isLoading = false;
          });
        });
      } else {
        Get.snackbar(
          "Error",
          result['message'].toString(),
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: isLoading!,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView(children: [
              SizedBox(
                height: 150,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 80.0,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    _buildInputField('Email', Icons.email, 'email'),
                    SizedBox(height: 20.0),
                    _buildInputField('Password', Icons.lock, 'password',
                        isPassword: true),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.pageRegister);
                      },
                      child: Text(
                        'Belum Punya Akun?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, IconData iconData, String type,
      {bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword ? _isPasswordVisible : false,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility))
              : null),
      validator: (value) {
        if (value!.isEmpty) {
          return '$label harus diisi';
        }

        if (type == 'email') {
          email = value;
        } else if (type == 'password') {
          password = value;
        }
      },
    );
  }
}
