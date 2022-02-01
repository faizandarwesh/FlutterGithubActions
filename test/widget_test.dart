// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubactionsflutter/auth/login/login_screen.dart';

import 'package:githubactionsflutter/main.dart';

void main() {
  testWidgets('Login Screen smoke test', (WidgetTester tester) async {

    //finds all widgets that needed
    final emailTextField = find.byKey(ValueKey("email_field"));
    final passwordTextField = find.byKey(ValueKey("password_field"));
    final loginButton = find.byKey(ValueKey("login_button"));

    //execute actual tests
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    await tester.enterText(emailTextField,"faizan@yopmail.com");
    await tester.enterText(passwordTextField,"Adobe110#");
    await tester.tap(loginButton);
    await tester.pump(); //rebuild the widgets
    
    //expects the output
    expect(find.text("faizan@yopmail.com"),findsOneWidget);
    expect(find.text("Adobe110#"),findsOneWidget);
    expect(find.text(""),findsNothing);

  });
}
