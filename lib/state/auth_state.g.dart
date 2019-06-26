// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthState> _$authStateSerializer = new _$AuthStateSerializer();

class _$AuthStateSerializer implements StructuredSerializer<AuthState> {
  @override
  final Iterable<Type> types = const [AuthState, _$AuthState];
  @override
  final String wireName = 'AuthState';

  @override
  Iterable serialize(Serializers serializers, AuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'loginButtonLabel',
      serializers.serialize(object.loginButtonLabel,
          specifiedType: const FullType(String)),
    ];
    if (object.currentUser != null) {
      result
        ..add('currentUser')
        ..add(serializers.serialize(object.currentUser,
            specifiedType: const FullType(User)));
    }
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
    if (object.loginError != null) {
      result
        ..add('loginError')
        ..add(serializers.serialize(object.loginError,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentUser':
          result.currentUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'usernameError':
          result.usernameError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'passwordError':
          result.passwordError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loginButtonLabel':
          result.loginButtonLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loginError':
          result.loginError = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthState extends AuthState {
  @override
  final User currentUser;
  @override
  final String username;
  @override
  final String password;
  @override
  final String usernameError;
  @override
  final String passwordError;
  @override
  final String loginButtonLabel;
  @override
  final String loginError;

  factory _$AuthState([void Function(AuthStateBuilder) updates]) =>
      (new AuthStateBuilder()..update(updates)).build();

  _$AuthState._(
      {this.currentUser,
      this.username,
      this.password,
      this.usernameError,
      this.passwordError,
      this.loginButtonLabel,
      this.loginError})
      : super._() {
    if (loginButtonLabel == null) {
      throw new BuiltValueNullFieldError('AuthState', 'loginButtonLabel');
    }
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        currentUser == other.currentUser &&
        username == other.username &&
        password == other.password &&
        usernameError == other.usernameError &&
        passwordError == other.passwordError &&
        loginButtonLabel == other.loginButtonLabel &&
        loginError == other.loginError;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, currentUser.hashCode), username.hashCode),
                        password.hashCode),
                    usernameError.hashCode),
                passwordError.hashCode),
            loginButtonLabel.hashCode),
        loginError.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('currentUser', currentUser)
          ..add('username', username)
          ..add('password', password)
          ..add('usernameError', usernameError)
          ..add('passwordError', passwordError)
          ..add('loginButtonLabel', loginButtonLabel)
          ..add('loginError', loginError))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState _$v;

  UserBuilder _currentUser;
  UserBuilder get currentUser => _$this._currentUser ??= new UserBuilder();
  set currentUser(UserBuilder currentUser) => _$this._currentUser = currentUser;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _usernameError;
  String get usernameError => _$this._usernameError;
  set usernameError(String usernameError) =>
      _$this._usernameError = usernameError;

  String _passwordError;
  String get passwordError => _$this._passwordError;
  set passwordError(String passwordError) =>
      _$this._passwordError = passwordError;

  String _loginButtonLabel;
  String get loginButtonLabel => _$this._loginButtonLabel;
  set loginButtonLabel(String loginButtonLabel) =>
      _$this._loginButtonLabel = loginButtonLabel;

  String _loginError;
  String get loginError => _$this._loginError;
  set loginError(String loginError) => _$this._loginError = loginError;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    if (_$v != null) {
      _currentUser = _$v.currentUser?.toBuilder();
      _username = _$v.username;
      _password = _$v.password;
      _usernameError = _$v.usernameError;
      _passwordError = _$v.passwordError;
      _loginButtonLabel = _$v.loginButtonLabel;
      _loginError = _$v.loginError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthState build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
              currentUser: _currentUser?.build(),
              username: username,
              password: password,
              usernameError: usernameError,
              passwordError: passwordError,
              loginButtonLabel: loginButtonLabel,
              loginError: loginError);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentUser';
        _currentUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
