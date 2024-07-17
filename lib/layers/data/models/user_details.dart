import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:impacteers/layers/data/models/serializer.dart';
part 'user_details.g.dart';

abstract class UserDetails implements Built<UserDetails, UserDetailsBuilder> {
  factory UserDetails(
          [Function(UserDetailsBuilder userDetailsBuilder) updates]) =
      _$UserDetails;
  UserDetails._();
  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'first_name')
  String get firstName;
  @BuiltValueField(wireName: 'last_name')
  String get lastName;
  @BuiltValueField(wireName: 'avatar')
  String get avatarUrl;

  String toJson() {
    return json.encode(serializers.serializeWith(UserDetails.serializer, this));
  }

  static UserDetails fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserDetails.serializer, json.decode(jsonString))!;
  }

  static Serializer<UserDetails> get serializer => _$userDetailsSerializer;
}
