import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/message_provider.dart';

class RoomListScreen extends StatefulWidget {
 // const RoomListScreen({super.key});

  @override
  State<RoomListScreen> createState() => _RoomListScreenState();
}

class _RoomListScreenState extends State<RoomListScreen> {
  late StreamSubscription _messageSubscription;
  void getRoomList(){
    final messageProvider = context.read<MessageProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      messageProvider.getRoomList();

      _messageSubscription = messageProvider.getRoomStream().listen((response) {
        if(response.data != null){
          ///adding new data
          messageProvider.addRoom(response.data!);
        }else if(response.hasErrors){
          ///For error Handling
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errors.first.message)));
        }
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Consumer<MessageProvider>(builder: (_,roomdata,__){
        print( roomdata.message.length);
        return ListView.builder(
          shrinkWrap: true,
          itemCount: roomdata.room.length,
            itemBuilder: (context,index){
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(roomdata.room[index].room_name),
              ),
            ),
          );
        });
      },)
    );
  }

  @override
  void initState() {
    getRoomList();
    super.initState();
  }
}
