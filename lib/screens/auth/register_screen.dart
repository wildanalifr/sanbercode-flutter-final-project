import 'package:final_project/routes/route_name.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _name = '';
  String _email = '';
  String _password = '';

  bool? isLoading = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _login();
    }
  }

  Future<dynamic> _login() async {
    try {
      var result = await AuthService().register({
        "username": _username,
        "name": _name,
        "email": _email,
        "password": _password,
      });
      if (result['isSuccess']) {
        setState(() {
          isLoading = true;
        });
        Get.snackbar(
          "Sukses Register",
          "silahkan login untuk masuk",
          backgroundColor: Colors.green[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
        Future.delayed(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.pageLogin);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _username = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more complex email validation here
                      return null;
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      // You can add more complex password validation here
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RouteName.pageLogin);
                    },
                    child: const Text(
                      'Sudah Punya Akun?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
