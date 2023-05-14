import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:smartclass/ui/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartclass/ui/firestore/firestore_list_screen.dart';
import 'package:smartclass/ui/posts/post_screens.dart';

import '../ui/auth/login_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      Timer(const Duration(seconds: 3),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FireStoreScreen())));
    }
    else{
      Timer(const Duration(seconds: 3),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())));
    }

  }
}
