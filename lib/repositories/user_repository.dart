import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/models/Users.dart';
import 'package:dartz/dartz.dart';

class UserRepository {

void getUserList(){
}
  ///For SignuP
  Future<Either<String,SignUpResult>> signUp(
      String username ,String email,String password)async{
    final Map<AuthUserAttributeKey,String> userAttribute={
      AuthUserAttributeKey.email:email
    };
    try{
      final result = await Amplify.Auth.signUp(
          username: username,
          password: password,
      options: SignUpOptions(userAttributes: userAttribute));
      return right(result);

    }on AuthException catch(e){
      return left(e.message);
    }
  }

  ///For OTP confirmation
  Future<Either<String ,bool>> confirmSignUp
      ({required String username,required String code})async{
    try{
      final result = await Amplify.Auth.confirmSignUp
        (username: username, confirmationCode: code);
      return right(result.isSignUpComplete);
    }on AuthException catch(e){
      return left(e.message);
    }
  }

  ///For Login
  Future<Either<String ,SignInResult>> signIn
      ({required String username,required String password})async{
    try{
      final result = await Amplify.Auth.signIn(username: username,password: password);
      return right(result);
    }on AuthException catch(e){
      return left(e.message);
    }
  }

  ///checking User Login Or Not For userSession
  Future<AuthSession> isUserLogedIn(){
    return Amplify.Auth.fetchAuthSession();
  }

  ///to Get UserInformation
  Future<AuthUser> getCurrentUser(){

    return Amplify.Auth.getCurrentUser();

  }

  ///For SignOut
  Future<SignOutResult> signOut(){
    return Amplify.Auth.signOut();
  }

 /* Future<Either<String ,SignOutResult>> signOut()async{
    try{
      final result = await Amplify.Auth.signOut();
      return right(result);
    }on AuthException catch(e){
      return left(e.message);
    }
  }*/
Future<Users> getCurrUser() async {
  AuthUser authUser = await Amplify.Auth.getCurrentUser();
  List<Users> user = await Amplify.DataStore.query(Users.classType,
      where: Users.ID.eq(authUser.userId));
  print("user.first"+user.toString());
  if (user.length > 0) {
    print(user.first);
    return user.first;
  } else{
    return user.first;
  }

}
Future<List<Users>> getAllOtherUses() async {
  AuthUser authUser = await Amplify.Auth.getCurrentUser();
  List<Users> users = await Amplify.DataStore.query(Users.classType,
      where: Users.ID.ne(authUser.userId));
  return users;
}
}
