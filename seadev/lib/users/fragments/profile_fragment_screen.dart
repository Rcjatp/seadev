import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seadev/users/authentication/login_screen.dart';
import 'package:seadev/users/userPrefrences/current_user.dart';
import 'package:seadev/users/userPrefrences/user_prefrences.dart';

class ProflieFragmentScreen extends StatelessWidget {

    final CurrentUser _currentUser = Get.put(CurrentUser());

    signOutUser() async 
    {
      var resultResponse = await Get.dialog(
        AlertDialog(
          backgroundColor: Color.fromARGB(255, 166, 234, 253),
          title: const Text(
            "Logout",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure?\nyou want to logout from app?"
          ),
          actions: [
            TextButton(
              onPressed: (){
                Get.back();
              },
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Get.back(result: "loggedOut");
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
      );

      if(resultResponse == "loggedOut"){
        //delete-remove the user data from phone local storage
        RememberUserprefs.removeUserInfo().then((value)
        {
          Get.off(LoginScreen());
        });
      }
    }

  Widget userInfoItemProfile(IconData iconData, String userData)
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 230, 228, 228),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 16,),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 177, 189, 253),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
    
          Center(
            child: Image.asset(
              "images/man.png",
              width: 240,
            ),
          ),
    
          const SizedBox(height: 20,),
    
          userInfoItemProfile(Icons.person, _currentUser.user.user_name),
          
          const SizedBox(
            height: 20,
          ),
          
          userInfoItemProfile(Icons.email, _currentUser.user.user_email),
    
          const SizedBox(height: 20,),
    
          Center(
            child: Material(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: ()
                {
                  signOutUser();
                },
                borderRadius: BorderRadius.circular(32),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
