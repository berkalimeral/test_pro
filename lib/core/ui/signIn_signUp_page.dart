// import 'package:flutter/material.dart';
// import 'package:test_pro/core/pages/register_page2.dart';

// import '../services/authenticate.dart';
// import 'my_text_field.dart';

// class SignInUpPage {
//   static Center signInPage(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MyTextField(labelText: 'Email', icon: const SizedBox()),
//             const SizedBox(
//               height: 30,
//             ),
//             MyTextField(
//                 labelText: 'Password',
//                 icon: const Icon(Icons.remove_red_eye_outlined)),
//             TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'Forgot Password?',
//                   style: TextStyle(decoration: TextDecoration.underline),
//                 )),
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 1,
//               height: 50,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(),
//                 onPressed: () async {
//                   try {
//                     var _userCredential = await FireStoreUtils.auth
//                         .signInWithEmailAndPassword(
//                             email: FireStoreUtils.email,
//                             password: FireStoreUtils.password);
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const RegisterPage2()));
//                   } catch (e) {
//                     debugPrint(e.toString());
//                   }
//                 },
//                 child: const Text('Continue'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static Center signUpPage(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             MyTextField(
//               icon: const SizedBox(),
//               labelText: 'Email',
//             ),
//             MyTextField(
//               icon: const Icon(Icons.remove_red_eye_outlined),
//               labelText: 'Create Password',
//             ),
//             MyTextField(
//               icon: const Icon(Icons.remove_red_eye_outlined),
//               labelText: 'Re-write Password',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//                 textAlign: TextAlign.center,
//                 'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Terms of Use augue enim, pulvinar Privacy Notice lacinia at.'),
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 1,
//               height: 50,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(),
//                 onPressed: () async {
//                   try {
//                     var _userCredential = await FireStoreUtils.auth
//                         .createUserWithEmailAndPassword(
//                             email: FireStoreUtils.email,
//                             password: FireStoreUtils.password);
//                     debugPrint(_userCredential.toString());
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const RegisterPage2()));
//                   } catch (e) {
//                     debugPrint(e.toString());
//                   }
//                 },
//                 child: const Text('Continue'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
