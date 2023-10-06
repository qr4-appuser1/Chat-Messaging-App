import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/Users.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username=TextEditingController();
  TextEditingController _password=TextEditingController();

  ///intializing SignUP Method
void signIn({required String username,required String password})async{
  final signInResponse= await context.read<UserProvider>().
  signIn(username: username, password: password);

  signInResponse.fold((error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }, (signInResult) {
    if(signInResult.nextStep.signInStep==AuthSignInStep.done){

      Amplify.DataStore.save(
        Users(
          email: "rohan@gmail.com",
          username: "rohan",
          bio: "",
          profileImage:
          "https://www.arrowbenefitsgroup.com/wp-content/uploads/2018/04/unisex-avatar.png",
          id: "1",
          createdAt: TemporalTimestamp.now(),
          isVerified: true,
        ),
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
          MessagesScreen()), (route) => false);
    }

  });

}
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _username,
            validator: RequiredValidator(errorText: requiredField),
            decoration: const InputDecoration(hintText: 'Username'),
            textInputAction: TextInputAction.next,
            onSaved: (username) {
              // Save it
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _password,
              validator: RequiredValidator(errorText: "Password is required"),
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onSaved: (passaword) {
                // Save it
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                ///Here We call Sign Up method
                signIn(username: _username.text,password: _password.text);

              }
            },
            child:context.watch<UserProvider>().isLoading?
            CircularProgressIndicator(color: Colors.white,):
            const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
