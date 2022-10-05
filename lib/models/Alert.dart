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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Alert type in your schema. */
@immutable
class Alert extends Model {
  static const classType = const _AlertModelType();
  final String id;
  final String? _notificationMethod;
  final String? _notificationMethodValue;
  final String? _ownerId;
  final String? _owner;
  final String? _currency;
  final String? _aboveOrBelow;
  final String? _price;
  final String? _isActive;
  final String? _created;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get notificationMethod {
    try {
      return _notificationMethod!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get notificationMethodValue {
    try {
      return _notificationMethodValue!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get ownerId {
    try {
      return _ownerId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get owner {
    try {
      return _owner!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get currency {
    try {
      return _currency!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get aboveOrBelow {
    try {
      return _aboveOrBelow!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get isActive {
    try {
      return _isActive!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get created {
    try {
      return _created!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Alert._internal({required this.id, required notificationMethod, required notificationMethodValue, required ownerId, required owner, required currency, required aboveOrBelow, required price, required isActive, required created, createdAt, updatedAt}): _notificationMethod = notificationMethod, _notificationMethodValue = notificationMethodValue, _ownerId = ownerId, _owner = owner, _currency = currency, _aboveOrBelow = aboveOrBelow, _price = price, _isActive = isActive, _created = created, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Alert({String? id, required String notificationMethod, required String notificationMethodValue, required String ownerId, required String owner, required String currency, required String aboveOrBelow, required String price, required String isActive, required String created}) {
    return Alert._internal(
      id: id == null ? UUID.getUUID() : id,
      notificationMethod: notificationMethod,
      notificationMethodValue: notificationMethodValue,
      ownerId: ownerId,
      owner: owner,
      currency: currency,
      aboveOrBelow: aboveOrBelow,
      price: price,
      isActive: isActive,
      created: created);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Alert &&
      id == other.id &&
      _notificationMethod == other._notificationMethod &&
      _notificationMethodValue == other._notificationMethodValue &&
      _ownerId == other._ownerId &&
      _owner == other._owner &&
      _currency == other._currency &&
      _aboveOrBelow == other._aboveOrBelow &&
      _price == other._price &&
      _isActive == other._isActive &&
      _created == other._created;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Alert {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("notificationMethod=" + "$_notificationMethod" + ", ");
    buffer.write("notificationMethodValue=" + "$_notificationMethodValue" + ", ");
    buffer.write("ownerId=" + "$_ownerId" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("aboveOrBelow=" + "$_aboveOrBelow" + ", ");
    buffer.write("price=" + "$_price" + ", ");
    buffer.write("isActive=" + "$_isActive" + ", ");
    buffer.write("created=" + "$_created" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Alert copyWith({String? id, String? notificationMethod, String? notificationMethodValue, String? ownerId, String? owner, String? currency, String? aboveOrBelow, String? price, String? isActive, String? created}) {
    return Alert._internal(
      id: id ?? this.id,
      notificationMethod: notificationMethod ?? this.notificationMethod,
      notificationMethodValue: notificationMethodValue ?? this.notificationMethodValue,
      ownerId: ownerId ?? this.ownerId,
      owner: owner ?? this.owner,
      currency: currency ?? this.currency,
      aboveOrBelow: aboveOrBelow ?? this.aboveOrBelow,
      price: price ?? this.price,
      isActive: isActive ?? this.isActive,
      created: created ?? this.created);
  }
  
  Alert.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _notificationMethod = json['notificationMethod'],
      _notificationMethodValue = json['notificationMethodValue'],
      _ownerId = json['ownerId'],
      _owner = json['owner'],
      _currency = json['currency'],
      _aboveOrBelow = json['aboveOrBelow'],
      _price = json['price'],
      _isActive = json['isActive'],
      _created = json['created'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'notificationMethod': _notificationMethod, 'notificationMethodValue': _notificationMethodValue, 'ownerId': _ownerId, 'owner': _owner, 'currency': _currency, 'aboveOrBelow': _aboveOrBelow, 'price': _price, 'isActive': _isActive, 'created': _created, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NOTIFICATIONMETHOD = QueryField(fieldName: "notificationMethod");
  static final QueryField NOTIFICATIONMETHODVALUE = QueryField(fieldName: "notificationMethodValue");
  static final QueryField OWNERID = QueryField(fieldName: "ownerId");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField ABOVEORBELOW = QueryField(fieldName: "aboveOrBelow");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField ISACTIVE = QueryField(fieldName: "isActive");
  static final QueryField CREATED = QueryField(fieldName: "created");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Alert";
    modelSchemaDefinition.pluralName = "Alerts";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.NOTIFICATIONMETHOD,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.NOTIFICATIONMETHODVALUE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.OWNERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.OWNER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.CURRENCY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.ABOVEORBELOW,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.ISACTIVE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Alert.CREATED,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _AlertModelType extends ModelType<Alert> {
  const _AlertModelType();
  
  @override
  Alert fromJson(Map<String, dynamic> jsonData) {
    return Alert.fromJson(jsonData);
  }
}