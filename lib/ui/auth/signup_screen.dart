// import 'dart:ffi';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:smartclass/widgets/round_button.dart';
// import 'package:firebase_auth/firebase_auth.dart ';
// import '../../utils/utils.dart';
// import 'login_screen.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   bool loading = false;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         SystemNavigator.pop();
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           //automaticallyImplyLeading: false,
//           title: Center(
//             child: Text("SignUp"),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           controller: emailController,
//                           decoration: const InputDecoration(
//                               hintText: 'Email', prefixIcon: Icon(Icons.email)),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Enter email';
//                             }
//                             return null;
//                           }),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                           controller: passwordController,
//                           keyboardType: TextInputType.text,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                               hintText: 'Password',
//                               prefixIcon: Icon(Icons.lock_outlined)),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Enter password';
//                             }
//                             return null;
//                           }),
//                     ],
//                   )),
//               const SizedBox(
//                 height: 50,
//               ),
//               RoundButton(
//                 title: 'SignUp',
//                 loading: loading,
//                 onTap: () {
//                   if (_formKey.currentState!.validate()) {
//                     setState(() {
//                       loading = true;
//                     });
//                     auth
//                         .createUserWithEmailAndPassword(
//                             email: emailController.text.toString(),
//                             password: passwordController.text.toString())
//                         .then((value) {
//                       setState(() {
//                         loading = false;
//                       });
//                     }).onError((error, stackTrace) {
//                       setState(() {
//                         loading = false;
//                       });
//                       Utils().toastMessage(error.toString());
//                     });
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already have an account?"),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       },
//                       child: Text("Login"))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smartclass/ui/auth/login_screen.dart';
import 'package:smartclass/utils/utils.dart';
import 'package:smartclass/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading=false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signup(){
    setState(() {
      loading=true;
    });
    if (_formKey.currentState!.validate()) {
      _auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value) {
        setState(() {
          loading=false;
        });

      }).onError((error, stackTrace){
        Utils().toastMessage(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('SignUp'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_open)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              RoundButton(
                title: 'Sign Up',
                loading: loading,
                onTap: () {
                  signup();
                },
              ),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('Login'))
                ],
              )
            ],
          ),
        ));
  }
}
