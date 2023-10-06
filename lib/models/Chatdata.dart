/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Chatdata type in your schema. */
class Chatdata extends amplify_core.Model {
  static const classType = const _ChatdataModelType();
  final String id;
  final String? _message;
  final amplify_core.TemporalTimestamp? _createdAt;
  final amplify_core.TemporalTimestamp? _updatedAt;
  final String? _chatId;
  final String? _senderId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ChatdataModelIdentifier get modelIdentifier {
      return ChatdataModelIdentifier(
        id: id
      );
  }
  
  String? get message {
    return _message;
  }
  
  amplify_core.TemporalTimestamp? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalTimestamp? get updatedAt {
    return _updatedAt;
  }
  
  String? get chatId {
    return _chatId;
  }
  
  String? get senderId {
    return _senderId;
  }
  
  const Chatdata._internal({required this.id, message, createdAt, updatedAt, chatId, senderId}): _message = message, _createdAt = createdAt, _updatedAt = updatedAt, _chatId = chatId, _senderId = senderId;
  
  factory Chatdata({String? id, String? message, amplify_core.TemporalTimestamp? createdAt, amplify_core.TemporalTimestamp? updatedAt, String? chatId, String? senderId}) {
    return Chatdata._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      message: message,
      createdAt: createdAt,
      updatedAt: updatedAt,
      chatId: chatId,
      senderId: senderId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Chatdata &&
      id == other.id &&
      _message == other._message &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _chatId == other._chatId &&
      _senderId == other._senderId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Chatdata {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.toString() : "null") + ", ");
    buffer.write("chatId=" + "$_chatId" + ", ");
    buffer.write("senderId=" + "$_senderId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Chatdata copyWith({String? message, amplify_core.TemporalTimestamp? createdAt, amplify_core.TemporalTimestamp? updatedAt, String? chatId, String? senderId}) {
    return Chatdata._internal(
      id: id,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId);
  }
  
  Chatdata copyWithModelFieldValues({
    ModelFieldValue<String?>? message,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? createdAt,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? updatedAt,
    ModelFieldValue<String?>? chatId,
    ModelFieldValue<String?>? senderId
  }) {
    return Chatdata._internal(
      id: id,
      message: message == null ? this.message : message.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      chatId: chatId == null ? this.chatId : chatId.value,
      senderId: senderId == null ? this.senderId : senderId.value
    );
  }
  
  Chatdata.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _message = json['message'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['updatedAt']) : null,
      _chatId = json['chatId'],
      _senderId = json['senderId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'message': _message, 'createdAt': _createdAt?.toSeconds(), 'updatedAt': _updatedAt?.toSeconds(), 'chatId': _chatId, 'senderId': _senderId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'message': _message,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'chatId': _chatId,
    'senderId': _senderId
  };

  static final amplify_core.QueryModelIdentifier<ChatdataModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ChatdataModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final MESSAGE = amplify_core.QueryField(fieldName: "message");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final CHATID = amplify_core.QueryField(fieldName: "chatId");
  static final SENDERID = amplify_core.QueryField(fieldName: "senderId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Chatdata";
    modelSchemaDefinition.pluralName = "Chatdata";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Chatdata.MESSAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Chatdata.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Chatdata.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Chatdata.CHATID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Chatdata.SENDERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _ChatdataModelType extends amplify_core.ModelType<Chatdata> {
  const _ChatdataModelType();
  
  @override
  Chatdata fromJson(Map<String, dynamic> jsonData) {
    return Chatdata.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Chatdata';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Chatdata] in your schema.
 */
class ChatdataModelIdentifier implements amplify_core.ModelIdentifier<Chatdata> {
  final String id;

  /** Create an instance of ChatdataModelIdentifier using [id] the primary key. */
  const ChatdataModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ChatdataModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ChatdataModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}