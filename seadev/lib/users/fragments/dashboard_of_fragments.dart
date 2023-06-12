import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:seadev/users/fragments/favorites_fragment_screen.dart';
import 'package:seadev/users/fragments/home_fragment_screen.dart';
import 'package:seadev/users/fragments/order_fragment_screen.dart';
import 'package:seadev/users/fragments/profile_fragment_screen.dart';
import 'package:seadev/users/userPrefrences/current_user.dart';

class DashboardOfFragments extends StatelessWidget
{
  CurrentUser _remamberCurrentUser = Get.put(CurrentUser());

  List<Widget> _fragmentScreens = 
  [
    HomeFragmentScreen(),
    FavoritesFragmentScreen(),
    OrderFragmentScreen(),
    ProflieFragmentScreen(),
  ];

  final List _navigattionButtonsProperties =
  [
    {
      "active_icon" : Icons.home,
      "non_active_icon" : Icons.home_outlined,
      "label" : "Home",
    },
    {
      "active_icon" : Icons.favorite,
      "non_active_icon" : Icons.favorite_border,
      "label" : "Favorite",
    },
     {
      "active_icon" : FontAwesomeIcons.boxOpen,
      "non_active_icon" : FontAwesomeIcons.box,
      "label" : "Order",
    },
     {
      "active_icon" : Icons.person,
      "non_active_icon" : Icons.person_2_outlined,
      "label" : "Profile",
    },
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentUser)
      {
        _remamberCurrentUser.getUserInfo();
      },
      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Obx(
              () => _fragmentScreens[_indexNumber.value]
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: _indexNumber.value,
              onTap: (value){
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Color.fromARGB(255, 247, 210, 26),
              unselectedItemColor: Color.fromARGB(255, 165, 80, 235),
              items: List.generate(4, (index) {
                var navBtnProperty = _navigattionButtonsProperties[index];
                return BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 155, 192, 249),
                  icon: Icon(navBtnProperty["non_active_icon"]),
                  activeIcon: Icon(navBtnProperty["active_icon"]),
                  label: navBtnProperty["label"],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}