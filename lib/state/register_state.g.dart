// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterState> _$registerStateSerializer =
    new _$RegisterStateSerializer();

class _$RegisterStateSerializer implements StructuredSerializer<RegisterState> {
  @override
  final Iterable<Type> types = const [RegisterState, _$RegisterState];
  @override
  final String wireName = 'RegisterState';

  @override
  Iterable serialize(Serializers serializers, RegisterState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'loadingStatus',
      serializers.serialize(object.loadingStatus,
          specifiedType: const FullType(LoadingStatus)),
    ];
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.retypePassword != null) {
      result
        ..add('retypePassword')
        ..add(serializers.serialize(object.retypePassword,
            specifiedType: const FullType(String)));
    }
    if (object.fullname != null) {
      result
        ..add('fullname')
        ..add(serializers.serialize(object.fullname,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.birthDate != null) {
      result
        ..add('birthDate')
        ..add(serializers.serialize(object.birthDate,
            specifiedType: const FullType(DateTime)));
    }
    if (object.usernameError != null) {
      result
        ..add('usernameError')
        ..add(serializers.serialize(object.usernameError,
            specifiedType: const FullType(String)));
    }
    if (object.passwordError != null) {
      result
        ..add('passwordError')
        ..add(serializers.serialize(object.passwordError,
            specifiedType: const FullType(String)));
    }
    if (object.retypePasswordError != null) {
      result
        ..add('retypePasswordError')
        ..add(serializers.serialize(object.retypePasswordError,
            specifiedType: const FullType(String)));
    }
    if (object.fullnameError != null) {
      result
        ..add('fullnameError')
        ..add(serializers.serialize(object.fullnameError,
            specifiedType: const FullType(String)));
    }
    if (object.companyError != null) {
      result
        ..add('companyError')
        ..add(serializers.serialize(object.companyError,
            specifiedType: const FullType(String)));
    }
    if (object.addressError != null) {
      result
        ..add('addressError')
        ..add(serializers.serialize(object.addressError,
            specifiedType: const FullType(String)));
    }
    if (object.birthdateError != null) {
      result
        ..add('birthdateError')
        ..add(serializers.serialize(object.birthdateError,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RegisterState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'retypePassword':
          result.retypePassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fullname':
          result.fullname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'usernameError':
          result.usernameError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'passwordError':
          result.passwordError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'retypePasswordError':
          result.retypePasswordError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fullnameError':
          result.fullnameError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'companyError':
          result.companyError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'addressError':
          result.addressError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthdateError':
          result.birthdateError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loadingStatus':
          result.loadingStatus = serializers.deserialize(value,
              specifiedType: const FullType(LoadingStatus)) as LoadingStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterState extends RegisterState {
  @override
  final String username;
  @override
  final String password;
  @override
  final String retypePassword;
  @override
  final String fullname;
  @override
  final String company;
  @override
  final String address;
  @override
  final DateTime birthDate;
  @override
  final String usernameError;
  @override
  final String passwordError;
  @override
  final String retypePasswordError;
  @override
  final String fullnameError;
  @override
  final String companyError;
  @override
  final String addressError;
  @override
  final String birthdateError;
  @override
  final LoadingStatus loadingStatus;

  factory _$RegisterState([void Function(RegisterStateBuilder) updates]) =>
      (new RegisterStateBuilder()..update(updates)).build();

  _$RegisterState._(
      {this.username,
      this.password,
      this.retypePassword,
      this.fullname,
      this.company,
      this.address,
      this.birthDate,
      this.usernameError,
      this.passwordError,
      this.retypePasswordError,
      this.fullnameError,
      this.companyError,
      this.addressError,
      this.birthdateError,
      this.loadingStatus})
      : super._() {
    if (loadingStatus == null) {
      throw new BuiltValueNullFieldError('RegisterState', 'loadingStatus');
    }
  }

  @override
  RegisterState rebuild(void Function(RegisterStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterStateBuilder toBuilder() => new RegisterStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterState &&
        username == other.username &&
        password == other.password &&
        retypePassword == other.retypePassword &&
        fullname == other.fullname &&
        company == other.company &&
        address == other.address &&
        birthDate == other.birthDate &&
        usernameError == other.usernameError &&
        passwordError == other.passwordError &&
        retypePasswordError == other.retypePasswordError &&
        fullnameError == other.fullnameError &&
        companyError == other.companyError &&
        addressError == other.addressError &&
        birthdateError == other.birthdateError &&
        loadingStatus == other.loadingStatus;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                username
                                                                    .hashCode),
                                                            password.hashCode),
                                                        retypePassword
                                                            .hashCode),
                                                    fullname.hashCode),
                                                company.hashCode),
                                            address.hashCode),
                                        birthDate.hashCode),
                                    usernameError.hashCode),
                                passwordError.hashCode),
                            retypePasswordError.hashCode),
                        fullnameError.hashCode),
                    companyError.hashCode),
                addressError.hashCode),
            birthdateError.hashCode),
        loadingStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterState')
          ..add('username', username)
          ..add('password', password)
          ..add('retypePassword', retypePassword)
          ..add('fullname', fullname)
          ..add('company', company)
          ..add('address', address)
          ..add('birthDate', birthDate)
          ..add('usernameError', usernameError)
          ..add('passwordError', passwordError)
          ..add('retypePasswordError', retypePasswordError)
          ..add('fullnameError', fullnameError)
          ..add('companyError', companyError)
          ..add('addressError', addressError)
          ..add('birthdateError', birthdateError)
          ..add('loadingStatus', loadingStatus))
        .toString();
  }
}

class RegisterStateBuilder
    implements Builder<RegisterState, RegisterStateBuilder> {
  _$RegisterState _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _retypePassword;
  String get retypePassword => _$this._retypePassword;
  set retypePassword(String retypePassword) =>
      _$this._retypePassword = retypePassword;

  String _fullname;
  String get fullname => _$this._fullname;
  set fullname(String fullname) => _$this._fullname = fullname;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  DateTime _birthDate;
  DateTime get birthDate => _$this._birthDate;
  set birthDate(DateTime birthDate) => _$this._birthDate = birthDate;

  String _usernameError;
  String get usernameError => _$this._usernameError;
  set usernameError(String usernameError) =>
      _$this._usernameError = usernameError;

  String _passwordError;
  String get passwordError => _$this._passwordError;
  set passwordError(String passwordError) =>
      _$this._passwordError = passwordError;

  String _retypePasswordError;
  String get retypePasswordError => _$this._retypePasswordError;
  set retypePasswordError(String retypePasswordError) =>
      _$this._retypePasswordError = retypePasswordError;

  String _fullnameError;
  String get fullnameError => _$this._fullnameError;
  set fullnameError(String fullnameError) =>
      _$this._fullnameError = fullnameError;

  String _companyError;
  String get companyError => _$this._companyError;
  set companyError(String companyError) => _$this._companyError = companyError;

  String _addressError;
  String get addressError => _$this._addressError;
  set addressError(String addressError) => _$this._addressError = addressError;

  String _birthdateError;
  String get birthdateError => _$this._birthdateError;
  set birthdateError(String birthdateError) =>
      _$this._birthdateError = birthdateError;

  LoadingStatus _loadingStatus;
  LoadingStatus get loadingStatus => _$this._loadingStatus;
  set loadingStatus(LoadingStatus loadingStatus) =>
      _$this._loadingStatus = loadingStatus;

  RegisterStateBuilder();

  RegisterStateBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _retypePassword = _$v.retypePassword;
      _fullname = _$v.fullname;
      _company = _$v.company;
      _address = _$v.address;
      _birthDate = _$v.birthDate;
      _usernameError = _$v.usernameError;
      _passwordError = _$v.passwordError;
      _retypePasswordError = _$v.retypePasswordError;
      _fullnameError = _$v.fullnameError;
      _companyError = _$v.companyError;
      _addressError = _$v.addressError;
      _birthdateError = _$v.birthdateError;
      _loadingStatus = _$v.loadingStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegisterState;
  }

  @override
  void update(void Function(RegisterStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterState build() {
    final _$result = _$v ??
        new _$RegisterState._(
            username: username,
            password: password,
            retypePassword: retypePassword,
            fullname: fullname,
            company: company,
            address: address,
            birthDate: birthDate,
            usernameError: usernameError,
            passwordError: passwordError,
            retypePasswordError: retypePasswordError,
            fullnameError: fullnameError,
            companyError: companyError,
            addressError: addressError,
            birthdateError: birthdateError,
            loadingStatus: loadingStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
