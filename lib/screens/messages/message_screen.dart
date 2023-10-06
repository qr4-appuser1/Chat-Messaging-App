import 'dart:async';

import 'package:chat/constants.dart';
import 'package:chat/models/Room.dart';
import 'package:chat/providers/message_provider.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../endToendChat/chatData.dart';
import '../../models/ChatMessage.dart';
import '../DashBoard/roomListScreen.dart';
import 'components/chat_input_field.dart';
import 'components/message_tile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  ///Inializing StreamSubscription for connection of user
  late StreamSubscription _messageSubscription;

  ///To Get All messages
  Future<void> getMessage() async {
    //await UserProvider().fetchCurrentUser();
    final messageProvider = context.read<MessageProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      messageProvider.getMessage();
      _messageSubscription = messageProvider.getMessageStream().listen((response) {
        if(response.data != null){
          ///adding new data
          messageProvider.addMessage(response.data!);
        }else if(response.hasErrors){
          ///For error Handling
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errors.first.message)));
        }
      });
    });

  }

  @override
  void dispose() {
    _messageSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Dev Chat"),
        actions: [

          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ChatPage(),
                ),
              );

            },
            icon: const Icon(Icons.chat),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  RoomListScreen(),
                ),
              );
              final roomcreated= Room(room_name: 'demoRoom'

              );
              final response = await context.read<MessageProvider>().createRoom(roomcreated);
              print(roomcreated);
              print(response);
            },
            icon: const Icon(Icons.create),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  RoomListScreen(),
                ),
              );

            },
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              ///for LogOut
              context.read<UserProvider>().signOut();
              if( context.watch<UserProvider>().isLoading){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()), (route) => false);
              }

            },
            icon:context.watch<UserProvider>().isLoading?CircularProgressIndicator(color: Colors.white,): const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),

              child: Consumer2<MessageProvider,UserProvider>(builder: (_,messProvider,userprovider,__){

                if(messProvider.isLoading){
                 return  Center(child: CircularProgressIndicator(color: Colors.white,));
                }
                if(messProvider.errorMessage != null){
                  return Center(
                    child: Text("Error"),
                  );
                }
                ///show the all messages using ListView
                   return ListView.builder(
                     reverse: true,
                itemCount: messProvider.message.length,
                itemBuilder: (context, index) => MessageTile(
                  message: messProvider.message[index],
                  isSender: messProvider.message[index].userId ==
                      userprovider.currentUser!.userId,
                ),
              );

              },),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }

  ///First call this method when this screen Open
  @override
  void initState() {

    getMessage();
    super.initState();
  }
}
