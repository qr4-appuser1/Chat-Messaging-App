import 'package:chat/constants.dart';
import 'package:chat/screens/DashBoard/roomListScreen.dart';
import 'package:chat/screens/auth/sign_in_screen.dart';
import 'package:chat/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
             Text("QR4ORDER"),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: const Text("Sign In"),
              ),
              const SizedBox(height: defaultPadding * 1.5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
                child: const Text("Sign Up"),
              ),
              const SizedBox(height: defaultPadding * 1.5),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  RoomListScreen(),
                    ),
                  );
                },
                style:
                ElevatedButton.styleFrom(backgroundColor: kErrorColor),
                child: const Text("My Rooms"),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
