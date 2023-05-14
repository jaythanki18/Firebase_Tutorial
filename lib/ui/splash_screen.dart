// import 'package:flutter/material.dart';
// import 'package:smartclass/firebase_services/splash_services.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   SplashServices splashScreen=SplashServices();
//   @override
//   void initState(){
//     super.initState();
//     splashScreen.isLogin(context);
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 90.0,horizontal: 80),
//         child: Image(image: AssetImage("assets/My_project.png"),),
//       ),
//     );
//   }
// }
import 'package:smartclass/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen=SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Firebase Tutorials',style: TextStyle(fontSize: 30),) ,
      ),
    );
  }
}
