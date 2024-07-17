library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:impacteers/layers/data/models/user_details.dart';
import 'package:impacteers/layers/data/models/user_model.dart';

part 'serializer.g.dart';

@SerializersFor(<Type>[UserModel, UserDetails])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) => serializers.deserializeWith<T>(
    serializers.serializerForType(T)! as Serializer<T>, value) as T;

BuiltList<T> deserializeListof<T>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));
