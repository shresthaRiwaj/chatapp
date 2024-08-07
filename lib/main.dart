import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messageapp/models/firebaseHelper.dart';
import 'package:messageapp/models/usermodel.dart';
import 'package:messageapp/newone/ContactPage.dart';
import 'package:messageapp/pages/CompleteProfile.dart';
import 'package:messageapp/pages/LoginPage.dart';
import 'package:messageapp/pages/SignUpPage.dart';
import 'package:messageapp/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messageapp/redirect/navigation.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';

var uuid = Uuid();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    UserModel? thisUserModel =
        await FirebaseHelper.getUserModelById(currentUser.uid);
    if (thisUserModel != null) {
      runApp(MyApp());

      // runApp(MyAppLoggedIn(
      //   userModel: thisUserModel,
      //   firebaseUser: currentUser,
      // ));
    } else {
      runApp(MyApp());
    }
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationMenu(),
    );
  }
}

class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MyAppLoggedIn(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        userModel: userModel,
        firebaseUser: firebaseUser,
      ),
    );
  }
}


