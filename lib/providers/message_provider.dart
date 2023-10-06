
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/models/Message.dart';
import 'package:chat/models/Room.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../repositories/message_repository.dart';

class MessageProvider with ChangeNotifier {
  final _messageRepository=MessageRepository();

  bool _isLoading = false;
  List<Message> _message=[];
  List<Room> _room=[];
  String? _errorMessage;
  bool get isLoading => _isLoading;
  List<Message> get message=>_message;
  List<Room> get room=>_room;
  String? get errorMessage => _errorMessage;
///This is Loading States
  void _setIsLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  ///To send and Store data in aws cloud
  Future<Either<String,Message?>> sendMessage(Message message){
    print("Message"+message.message);
   return _messageRepository.sendMessage(message);
  }

  ///To Get and display  The Message
  void getMessage() async{
    _setIsLoading(true);
    final messageResponse=await _messageRepository.getMessage();
    messageResponse.fold((error) {
      _errorMessage =error;
      notifyListeners();

    }, (message){
_message= message;
notifyListeners();
    });
    _setIsLoading(false);
  }
  Stream<GraphQLResponse<Message>> getMessageStream(){
    return _messageRepository.subscribeToMessage();
  }
  Stream<GraphQLResponse<Room>> getRoomStream(){
    return _messageRepository.subscribeToRoom();
  }
  /// To adding New Message
  void addMessage(Message message){
    _message.insert(0, message);
    notifyListeners();
  }

  void addRoom(Room message){
    _room.insert(0, message);
    notifyListeners();
  }
  Future<Either<String,Room?>> createRoom(Room message){
    print("Message"+message.room_name);
    return _messageRepository.createRoom(message);
  }
  void getRoomList() async{
    _setIsLoading(true);
    final messageResponse=await _messageRepository.getRoomList();
    print(messageResponse);
    messageResponse.fold((error) {
      _errorMessage =error;
      notifyListeners();

    }, (message){
      _room= message;
      notifyListeners();
    });
    _setIsLoading(false);
  }
}
