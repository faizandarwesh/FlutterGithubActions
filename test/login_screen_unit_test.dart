import 'package:flutter_test/flutter_test.dart';
import 'package:githubactionsflutter/auth/login/login_screen.dart';


void main(){
  group('Login Screen Tests', () {
    test('Empty email test',(){
     var result = FormValidator.validateEmail('');
     expect(result,"Please enter an email!");
    });

    test('Invalid email test',(){
      var result = FormValidator.validateEmail('test');
      expect(result,"Please enter a valid email");
    });

    test('Valid email test', (){
      var result = FormValidator.validateEmail('admin@gmail.com');
      expect(result,null);
    });

    test('Empty password test',(){
      var result = FormValidator.validatePassword('');
      expect(result,'Please enter a password.');
    });

    test('Invalid password test',(){
      var result = FormValidator.validatePassword('12345');
      expect(result,'Password must contain at least 8 characters.');
    });

    test('Valid password test',(){
      var result = FormValidator.validatePassword('Adobe110#');
      expect(result,null);

    });
  });
}