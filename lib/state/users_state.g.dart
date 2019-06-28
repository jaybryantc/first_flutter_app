// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsersState extends UsersState {
  @override
  final List<User> users;
  @override
  final LoadingStatus loadingStatus;

  factory _$UsersState([void Function(UsersStateBuilder) updates]) =>
      (new UsersStateBuilder()..update(updates)).build();

  _$UsersState._({this.users, this.loadingStatus}) : super._() {
    if (loadingStatus == null) {
      throw new BuiltValueNullFieldError('UsersState', 'loadingStatus');
    }
  }

  @override
  UsersState rebuild(void Function(UsersStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersStateBuilder toBuilder() => new UsersStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersState &&
        users == other.users &&
        loadingStatus == other.loadingStatus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, users.hashCode), loadingStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersState')
          ..add('users', users)
          ..add('loadingStatus', loadingStatus))
        .toString();
  }
}

class UsersStateBuilder implements Builder<UsersState, UsersStateBuilder> {
  _$UsersState _$v;

  List<User> _users;
  List<User> get users => _$this._users;
  set users(List<User> users) => _$this._users = users;

  LoadingStatus _loadingStatus;
  LoadingStatus get loadingStatus => _$this._loadingStatus;
  set loadingStatus(LoadingStatus loadingStatus) =>
      _$this._loadingStatus = loadingStatus;

  UsersStateBuilder();

  UsersStateBuilder get _$this {
    if (_$v != null) {
      _users = _$v.users;
      _loadingStatus = _$v.loadingStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UsersState;
  }

  @override
  void update(void Function(UsersStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersState build() {
    final _$result =
        _$v ?? new _$UsersState._(users: users, loadingStatus: loadingStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
