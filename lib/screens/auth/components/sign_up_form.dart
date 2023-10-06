import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../sign_in_screen.dart';
import '../verification_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
 // late String? _username,_email,_password;
   TextEditingController _username=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  ///Initializing Sign Up Method
  void signUp(String username,String email, String password)async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final signUpResult = await  context.read<UserProvider>().signUp(username, password, email);
      signUpResult.fold((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error))
        );
      },
              (step){
        if(step.nextStep.signUpStep==AuthSignUpStep.confirmSignUp){
          /// here OTP checking
          Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  VerificationScreen(username: username,),
                    ),
                  );
        }
          });


    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Username'),
            controller: _username,
           /* onSaved: (username) {
              print(username);
              _username=username.toString();

              // Save it
            },*/
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Email'),
          controller: _email,
          /*  onSaved: (email) {
              setState(() {
                _email=email!;
              });

              // Save it
            },*/
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
            controller: _password,
            /*  onSaved: (passaword) {
                setState(() {
                  _password=passaword!;
                });

                // Save it
              },*/
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: ElevatedButton(
              onPressed: ()  {
                print("rohan");
                print(_username.text);
                signUp(_username.text,_email.text,_password.text);
              },
              child: const Text("Sign Up"),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            ),
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                children: [
                  TextSpan(
                    text: "Sign in",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
