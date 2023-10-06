import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../models/Users.dart';

class UserProvider with ChangeNotifier {
  final _userRepositery = UserRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  AuthUser? get currentUser => _current;
  AuthUser? _current;
  Users? currUser1;
  List<Users>? allOtherUsers;
  Future fetchCurrentUser() async {
    currUser1 = await _userRepositery.getCurrUser();
    print(currUser1);
    notifyListeners();
  }
  ///To Loading State
  void _setIsLoading(bool value){
    _isLoading= value;
    ///its Notify
    notifyListeners();
  }

  /// To create SignUp User
  Future<Either<String, SignUpResult>> signUp(
      String username,String password,String email)async{
    _setIsLoading(true);
    final response= await _userRepositery.signUp(username, email, password);
    _setIsLoading(false);
    return response;
  }

  /// To create Confirm OTP
  Future<Either<String, bool>> confirmSignUp
  ({required String username,required String code})async{
    _setIsLoading(true);
    final response= await _userRepositery.confirmSignUp(username: username,code: code);
    _setIsLoading(false);
    return response;
  }

  /// To create For Login
  Future<Either<String, SignInResult>> signIn
      ({required String username,required String password})async{
    _setIsLoading(true);
    final response= await _userRepositery.signIn(username: username,password: password);
    final user = await _userRepositery.getCurrentUser();
    _current = user;
    _setIsLoading(false);
    return response;
  }

  ///To create user Session Login
  Future<AuthUser?>checkedLoginUser()async{
    final authSession = await _userRepositery.isUserLogedIn();
    if(authSession.isSignedIn){
      _current= await _userRepositery.getCurrentUser();
      return _current;
    }
    return null;
  }


  ///To SignOut User
Future<Either<String,SignOutResult>> signOut()async{
    _setIsLoading(true);
try{
  final response = await _userRepositery.signOut();
  _current = null;
  _setIsLoading(false);
  return right(response);
}on AuthException catch(e){
_setIsLoading(false);
    return left(e.message);
}
}
}
