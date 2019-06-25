// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'fullname',
      serializers.serialize(object.fullname,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'birthdate',
      serializers.serialize(object.birthdate,
          specifiedType: const FullType(DateTime)),
      'company',
      serializers.serialize(object.company,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fullname':
          result.fullname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthdate':
          result.birthdate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final int id;
  @override
  final String fullname;
  @override
  final String address;
  @override
  final DateTime birthdate;
  @override
  final String company;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.id, this.fullname, this.address, this.birthdate, this.company})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('User', 'id');
    }
    if (fullname == null) {
      throw new BuiltValueNullFieldError('User', 'fullname');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('User', 'address');
    }
    if (birthdate == null) {
      throw new BuiltValueNullFieldError('User', 'birthdate');
    }
    if (company == null) {
      throw new BuiltValueNullFieldError('User', 'company');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        fullname == other.fullname &&
        address == other.address &&
        birthdate == other.birthdate &&
        company == other.company;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), fullname.hashCode), address.hashCode),
            birthdate.hashCode),
        company.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('fullname', fullname)
          ..add('address', address)
          ..add('birthdate', birthdate)
          ..add('company', company))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _fullname;
  String get fullname => _$this._fullname;
  set fullname(String fullname) => _$this._fullname = fullname;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  DateTime _birthdate;
  DateTime get birthdate => _$this._birthdate;
  set birthdate(DateTime birthdate) => _$this._birthdate = birthdate;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _fullname = _$v.fullname;
      _address = _$v.address;
      _birthdate = _$v.birthdate;
      _company = _$v.company;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            id: id,
            fullname: fullname,
            address: address,
            birthdate: birthdate,
            company: company);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
