import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubactionsflutter/home/ui/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    key: Key("email_field"),
                    decoration: InputDecoration(labelText: "Email"),
                    validator: FormValidator.validateEmail,
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                  ),
                ),
                Container(
                  child: TextFormField(
                    key: Key("password_field"),
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: FormValidator.validatePassword,
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  color: Colors.blue,
                  width: 200,
                  height: 50,
                  child: TextButton(
                    key: Key("login_button"),
                    onPressed: (){
                      // login(context);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  login(BuildContext context) {
    final FormState? form = _formKey.currentState;
    if (form != null) {
      if (!form.validate()) {
        Get.snackbar('Failure', 'Please enter valid details',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        form.save();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }
}

class FormValidator {
  static String? validateEmail(String? email) {
    if (email!.isEmpty) return "Please enter an email!";
    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) return 'Please enter a password.';
    if (value.length < 8) return 'Password must contain at least 8 characters.';
    return null;
  }
}
