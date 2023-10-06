import 'package:chat/models/Users.dart';
import 'package:chat/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

class UserStore extends ChangeNotifier {
  UserStore._();
  static UserStore _instance = UserStore._();
  factory UserStore() => _instance;

  static const String CURR_USER = 'curr_user';

  UserRepository _userRepository = UserRepository();

  Users? currUser;
  List<Users>? allOtherUsers;

  Future fetchCurrentUser() async {
    currUser = await _userRepository.getCurrUser();
    notifyListeners();
  }

  Future fetchAllOtherUsers() async {
    allOtherUsers = await _userRepository.getAllOtherUses();
    notifyListeners();
  }

// Future updateProfileImage({File image, String key}) async {
//   await _userRepository.updateProfileImage(image, key);
// }
}