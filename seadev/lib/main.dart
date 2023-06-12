import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seadev/users/authentication/login_screen.dart';
import 'package:seadev/users/fragments/dashboard_of_fragments.dart';
import 'package:seadev/users/userPrefrences/user_prefrences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clothes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: RememberUserprefs.readUserInfo(),
        builder: (context, dataSnapShot) {
          if(dataSnapShot.data == null)
          {
            return const LoginScreen();
          }
          else
          {
            return DashboardOfFragments();
          }
        },
      ),
    );
  }
}
