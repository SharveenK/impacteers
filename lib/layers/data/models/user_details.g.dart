// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDetails> _$userDetailsSerializer = new _$UserDetailsSerializer();

class _$UserDetailsSerializer implements StructuredSerializer<UserDetails> {
  @override
  final Iterable<Type> types = const [UserDetails, _$UserDetails];
  @override
  final String wireName = 'UserDetails';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'first_name',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'last_name',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'avatar',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserDetails deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'avatar':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserDetails extends UserDetails {
  @override
  final int id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String avatarUrl;

  factory _$UserDetails([void Function(UserDetailsBuilder)? updates]) =>
      (new UserDetailsBuilder()..update(updates))._build();

  _$UserDetails._(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatarUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserDetails', 'id');
    BuiltValueNullFieldError.checkNotNull(email, r'UserDetails', 'email');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'UserDetails', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lastName, r'UserDetails', 'lastName');
    BuiltValueNullFieldError.checkNotNull(
        avatarUrl, r'UserDetails', 'avatarUrl');
  }

  @override
  UserDetails rebuild(void Function(UserDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailsBuilder toBuilder() => new UserDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetails &&
        id == other.id &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDetails')
          ..add('id', id)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('avatarUrl', avatarUrl))
        .toString();
  }
}

class UserDetailsBuilder implements Builder<UserDetails, UserDetailsBuilder> {
  _$UserDetails? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  UserDetailsBuilder();

  UserDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _avatarUrl = $v.avatarUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDetails;
  }

  @override
  void update(void Function(UserDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDetails build() => _build();

  _$UserDetails _build() {
    final _$result = _$v ??
        new _$UserDetails._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'UserDetails', 'id'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserDetails', 'email'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'UserDetails', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'UserDetails', 'lastName'),
            avatarUrl: BuiltValueNullFieldError.checkNotNull(
                avatarUrl, r'UserDetails', 'avatarUrl'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
