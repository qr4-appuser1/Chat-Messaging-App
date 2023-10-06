import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/models/Message.dart';
import 'package:chat/models/Room.dart';
import 'package:dartz/dartz.dart';

class MessageRepository {

  ///here we Send the message request using GraphQLApi And recieve the response
  Future<Either<String, Message?>> sendMessage(Message message)async{
    try{
      print("rohan3"+message.message);
     // final request = ModelMutations.create(message);
      final request = ModelMutations.create(message);
      print(request);
      final respnse = await Amplify.API.mutate(request: request).response;
     print("rohan"+respnse.errors.toString());
      return right(respnse.data);

    }on ApiException catch(e){
      return left(e.message);
    }
  }


  ///Here we Get The All data stored in Our Stored DataBase
  Future<Either<String,List<Message>>> getMessage()async{
    try{
      final request = ModelQueries.list(Message.classType,limit: 20);
      final response=await Amplify.API.query(request: request).response;
      final message = response.data?.items.whereType<Message>().toList();
      if(message != null){
        message.sort((a,b)=>b.createdAt.compareTo(a.createdAt));
      }

      return right(message ?? []);
    }on ApiException catch(e){
      return left(e.message);

    }
  }
 /* Future<Either<>String,List<Message>> getLatestMessage()async{
    final
  }*/

  ///Creating Connection between User...
  Stream<GraphQLResponse<Message>> subscribeToMessage(){
    final subscriptionRequest= ModelSubscriptions.onCreate(Message.classType);
    final operation = Amplify.API.subscribe(subscriptionRequest,
    onEstablished: ()=>safePrint("Subscription Established"));
    return operation;
  }
  Stream<GraphQLResponse<Room>> subscribeToRoom(){
    final subscriptionRequest= ModelSubscriptions.onCreate(Room.classType);
    final operation = Amplify.API.subscribe(subscriptionRequest,
        onEstablished: ()=>safePrint("Subscription Established"));
    return operation;
  }

  Future<Either<String, Room?>> createRoom(Room message)async{
    try{
      print("rohan3"+message.id);
      // final request = ModelMutations.create(message);
      final request = ModelMutations.create(message);
      print(request);
      final respnse = await Amplify.API.mutate(request: request).response;
      print("rohan"+respnse.errors.toString());
      return right(respnse.data);

    }on ApiException catch(e){
      return left(e.message);
    }
  }
  Future<Either<String,List<Room>>> getRoomList()async{
    try{
      final request = ModelQueries.list(Room.classType);
      print(request);

      final response=await Amplify.API.query(request: request).response;
      print(response.data);
      final message = response.data?.items.whereType<Room>().toList();
      if(message != null){
        message.sort((a,b)=>b.createdAt!.compareTo(a.createdAt!));
      }

      return right(message ?? []);
    }on ApiException catch(e){
      return left(e.message);

    }
  }
}
