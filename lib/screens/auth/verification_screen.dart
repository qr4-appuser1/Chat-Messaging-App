import 'package:chat/constants.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/logo_with_title.dart';

class VerificationScreen extends StatefulWidget {
   VerificationScreen({Key? key,required this.username}) : super(key: key);
 String username;
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _otp=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoWithTitle(
        title: 'Verification',
        subText: "Verification code has been sent to your mail",
        children: [
          const SizedBox(height: defaultPadding),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _otp,
              onSaved: (otpCode) {},
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(hintText: "Enter OTP"),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: ()async {
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                final result= await context.read<UserProvider>().
                confirmSignUp(username: widget.username, code: _otp.text);
                result.fold((error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                }, (_) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MessagesScreen()), (route) => false);
                });
              }
            },
            child:context.watch<UserProvider>().isLoading?
                CircularProgressIndicator(color: Colors.white,):
            const Text("Validate"),
          ),
        ],
      ),
    );
  }
}
