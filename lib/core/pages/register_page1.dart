import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:test_pro/core/pages/register_page2.dart';
import 'package:test_pro/core/product/padding/page_padding.dart';
import 'package:test_pro/core/services/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../ui/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  final TextEditingController _emailSignInController = TextEditingController();
  final TextEditingController _passwordSignInController =
      TextEditingController();
  late TabController _tabController;

  FireStoreUtils services = FireStoreUtils();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    services.auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint(
            'User is signed in! ${user.email} email status: ${user.emailVerified}');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _emailSignInController.dispose();
    _passwordSignInController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.green,
            tabs: const [
              Tab(
                text: "Sign Up",
              ),
              Tab(
                text: "Sign In",
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: RectangularIndicator(
              bottomLeftRadius: 100,
              bottomRightRadius: 100,
              topLeftRadius: 100,
              topRightRadius: 100,
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            signUpPage(context),
            signInPage(context),
          ],
        ),
      ),
    );
  }

  Widget signInPage(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 18, top: 48),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextFormFieldEmail(
                    controller: _emailSignInController,
                    labelText: 'Email',
                    icon: const SizedBox()),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    visible: true,
                    controller: _passwordSignInController,
                    labelText: 'Password',
                    icon: const Icon(Icons.remove_red_eye_outlined)),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(decoration: TextDecoration.underline),
                    )),
                const SizedBox(
                  height: 270,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () async {
                      try {
                        services.signInWithEmailAndPassword(
                            _emailSignInController.text,
                            _passwordSignInController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage2()));
                        ;

                        // var _userCredential = await FireStoreUtils.auth
                        //     .signInWithEmailAndPassword(
                        //         email: FireStoreUtils.email,
                        //         password: FireStoreUtils.password);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center signUpPage(BuildContext context) {
    return Center(
      child: Padding(
        padding: const PagePadding.all(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormFieldEmail(
                controller: _emailController,
                icon: const SizedBox(),
                labelText: 'Email',
              ),
              MyTextField(
                visible: true,
                controller: _passwordController,
                icon: const Icon(Icons.remove_red_eye_outlined),
                labelText: 'Create Password',
              ),
              MyTextField(
                visible: true,
                controller: _passwordAgainController,
                icon: const Icon(Icons.remove_red_eye_outlined),
                labelText: 'Re-write Password',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  textAlign: TextAlign.center,
                  'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Terms of Use augue enim, pulvinar Privacy Notice lacinia at.'),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                height: 49,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () async {
                    try {
                      services.createUserWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage2()));
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
