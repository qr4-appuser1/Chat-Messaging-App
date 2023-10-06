
import 'package:chat/endToendChat/Store/chatstore.dart';
import 'package:chat/endToendChat/Store/userstore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatStore? chatStore;
  UserStore? userStore;
  @override
  void initState() {
 //   userStore = context.read<UserStore>();
    chatStore = Provider.of<ChatStore>(context, listen: false);
    fetchUserChats();
    super.initState();
  }

  fetchUserChats() async {
    await chatStore?.fetchUserChats();
    if (mounted) setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: chatStore?.chatData != [] ? getBody() : Container(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:(){
                 print(chatStore?.chatData);
    },
                child: Text(
                  "Chats",
                  style: TextStyle(
                      fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon:
                    Icon(Icons.search, color: Colors.white.withOpacity(0.3)),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle:
                    TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
          child: Divider(color: Colors.white.withOpacity(0.3)),
        ),
        SizedBox(
          height: 10,
        ),
        if (chatStore!.userChats.length > 0)
          Column(
            children: chatStore!.userChats
                .map((user) => UserChatCard(
              context: context,
              size: size,
              name: user['otherUserName'],
              profileImage: user['otherUserProfileImage'],
              chatId: user['chatId'],
            ))
                .toList(),
          ),
      ],
    );
  }
}

class UserChatCard extends StatelessWidget {
   UserChatCard({
    Key? key,
     required this.context,
    required this.size,
    required this.name,
    required this.profileImage,
    required this.chatId,
  }) : super(key: key);

  final BuildContext context;
  final Size size;
  final String name;
  final String profileImage;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    /*    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailPage(
              name: name,
              img: profileImage,
              chatId: chatId,
            ),
          ),
        );*/
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
           /*     image: DecorationImage(
                    image: Image(profileImage),
                    fit: BoxFit.cover),*/
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (size.width - 40) * 0.6,
                              child: Text(name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Expanded(
                              child: Text(
                                "10/08/20",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.3),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
