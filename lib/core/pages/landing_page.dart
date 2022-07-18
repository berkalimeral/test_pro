import 'package:flutter/material.dart';

import 'package:test_pro/core/constants.dart';
import 'package:test_pro/core/pages/register_page1.dart';
import 'package:test_pro/core/services/authenticate.dart';

import '../ui/continueActionButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final String descTitle = 'Mobile Application Test Pro';

  FireStoreUtils services = FireStoreUtils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0, left: 40.0, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FlutterLogo(
                size: 200,
              ),
              Text(
                descTitle,
                style: Theme.of(context).textTheme.headline5,
              ),
              ContinueActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                buttonTitle: 'E-Mail Account Login',
                iconPath: 'assets/images/email_logo.png',
                iconColor: Colors.white,
                buttonColor: EMAIL_BUTTON_COLOR,
              ),
              ContinueActionButton(
                onPressed: services.signInWithFacebook,
                buttonTitle: 'Facebook Account Login',
                iconPath: 'assets/images/facebook_logo.png',
                iconColor: Colors.white,
                buttonColor: FACEBOOK_BUTTON_COLOR,
              ),
              ContinueActionButton(
                onPressed: services.signInWithGoogle,
                buttonTitle: 'Google Account Login',
                iconPath: 'assets/images/google_logo.png',
                iconColor: Colors.white,
                buttonColor: GOOGLE_BUTTON_COLOR,
              ),
              ContinueActionButton(
                onPressed: () {
                  services.signInAnonymously();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                buttonTitle: 'Continue Without Signing Up',
                iconPath: 'assets/images/signin.png',
                iconColor: const Color(CONTINUE_BUTTON_COLOR),
                buttonColor: CONTINUE_BUTTON_COLOR,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
