import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:impacteers/layers/data/models/serializer.dart';
import 'package:impacteers/layers/data/models/user_details.dart';
part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  factory UserModel([Function(UserModelBuilder userModelBuilder) updates]) =
      _$UserModel;
  UserModel._();
  @BuiltValueField(wireName: 'data')
  BuiltList<UserDetails>? get data;
  String toJson() {
    return json.encode(serializers.serializeWith(UserModel.serializer, this));
  }

  static UserModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
