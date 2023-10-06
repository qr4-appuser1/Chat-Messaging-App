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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Users type in your schema. */
class Users extends amplify_core.Model {
  static const classType = const _UsersModelType();
  final String id;
  final String? _username;
  final String? _email;
  final String? _bio;
  final String? _profileImage;
  final bool? _isVerified;
  final amplify_core.TemporalTimestamp? _createdAt;
  final List<String>? _chats;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UsersModelIdentifier get modelIdentifier {
      return UsersModelIdentifier(
        id: id
      );
  }
  
  String? get username {
    return _username;
  }
  
  String? get email {
    return _email;
  }
  
  String? get bio {
    return _bio;
  }
  
  String? get profileImage {
    return _profileImage;
  }
  
  bool? get isVerified {
    return _isVerified;
  }
  
  amplify_core.TemporalTimestamp? get createdAt {
    return _createdAt;
  }
  
  List<String>? get chats {
    return _chats;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Users._internal({required this.id, username, email, bio, profileImage, isVerified, createdAt, chats, updatedAt}): _username = username, _email = email, _bio = bio, _profileImage = profileImage, _isVerified = isVerified, _createdAt = createdAt, _chats = chats, _updatedAt = updatedAt;
  
  factory Users({String? id, String? username, String? email, String? bio, String? profileImage, bool? isVerified, amplify_core.TemporalTimestamp? createdAt, List<String>? chats}) {
    return Users._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      username: username,
      email: email,
      bio: bio,
      profileImage: profileImage,
      isVerified: isVerified,
      createdAt: createdAt,
      chats: chats != null ? List<String>.unmodifiable(chats) : chats);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Users &&
      id == other.id &&
      _username == other._username &&
      _email == other._email &&
      _bio == other._bio &&
      _profileImage == other._profileImage &&
      _isVerified == other._isVerified &&
      _createdAt == other._createdAt &&
      DeepCollectionEquality().equals(_chats, other._chats);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Users {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("bio=" + "$_bio" + ", ");
    buffer.write("profileImage=" + "$_profileImage" + ", ");
    buffer.write("isVerified=" + (_isVerified != null ? _isVerified!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("chats=" + (_chats != null ? _chats!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Users copyWith({String? username, String? email, String? bio, String? profileImage, bool? isVerified, amplify_core.TemporalTimestamp? createdAt, List<String>? chats}) {
    return Users._internal(
      id: id,
      username: username ?? this.username,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      chats: chats ?? this.chats);
  }
  
  Users copyWithModelFieldValues({
    ModelFieldValue<String?>? username,
    ModelFieldValue<String?>? email,
    ModelFieldValue<String?>? bio,
    ModelFieldValue<String?>? profileImage,
    ModelFieldValue<bool?>? isVerified,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? createdAt,
    ModelFieldValue<List<String>?>? chats
  }) {
    return Users._internal(
      id: id,
      username: username == null ? this.username : username.value,
      email: email == null ? this.email : email.value,
      bio: bio == null ? this.bio : bio.value,
      profileImage: profileImage == null ? this.profileImage : profileImage.value,
      isVerified: isVerified == null ? this.isVerified : isVerified.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      chats: chats == null ? this.chats : chats.value
    );
  }
  
  Users.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _email = json['email'],
      _bio = json['bio'],
      _profileImage = json['profileImage'],
      _isVerified = json['isVerified'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _chats = json['chats']?.cast<String>(),
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'email': _email, 'bio': _bio, 'profileImage': _profileImage, 'isVerified': _isVerified, 'createdAt': _createdAt?.toSeconds(), 'chats': _chats, 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'username': _username,
    'email': _email,
    'bio': _bio,
    'profileImage': _profileImage,
    'isVerified': _isVerified,
    'createdAt': _createdAt,
    'chats': _chats,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UsersModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UsersModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final BIO = amplify_core.QueryField(fieldName: "bio");
  static final PROFILEIMAGE = amplify_core.QueryField(fieldName: "profileImage");
  static final ISVERIFIED = amplify_core.QueryField(fieldName: "isVerified");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final CHATS = amplify_core.QueryField(fieldName: "chats");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Users";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: Users.USERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Users.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Users.BIO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Users.PROFILEIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Users.ISVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Users.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Users.CHATS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UsersModelType extends amplify_core.ModelType<Users> {
  const _UsersModelType();
  
  @override
  Users fromJson(Map<String, dynamic> jsonData) {
    return Users.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Users';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Users] in your schema.
 */
class UsersModelIdentifier implements amplify_core.ModelIdentifier<Users> {
  final String id;

  /** Create an instance of UsersModelIdentifier using [id] the primary key. */
  const UsersModelIdentifier({
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
  String toString() => 'UsersModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UsersModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}