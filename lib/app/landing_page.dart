import 'package:dc_flutter_sm/services/auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.auth});

  final Auth auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}
