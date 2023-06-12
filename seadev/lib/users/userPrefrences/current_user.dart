import 'package:get/get.dart';
import 'package:seadev/users/model/user.dart';
import 'package:seadev/users/userPrefrences/user_prefrences.dart';

class CurrentUser extends GetxController
{
  Rx<User> _currentUser = User(0, '', '', '').obs;

  User get user => _currentUser.value;

  getUserInfo() async
  {
    User? getUserInfoFromLocalStorage = await RememberUserprefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}