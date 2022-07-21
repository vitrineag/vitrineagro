// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorities_startups_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserFavoritiesStartupsRecord>
    _$userFavoritiesStartupsRecordSerializer =
    new _$UserFavoritiesStartupsRecordSerializer();

class _$UserFavoritiesStartupsRecordSerializer
    implements StructuredSerializer<UserFavoritiesStartupsRecord> {
  @override
  final Iterable<Type> types = const [
    UserFavoritiesStartupsRecord,
    _$UserFavoritiesStartupsRecord
  ];
  @override
  final String wireName = 'UserFavoritiesStartupsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserFavoritiesStartupsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createDate;
    if (value != null) {
      result
        ..add('createDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.startup;
    if (value != null) {
      result
        ..add('startup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('userName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userPhone;
    if (value != null) {
      result
        ..add('userPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserFavoritiesStartupsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserFavoritiesStartupsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createDate':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'startup':
          result.startup = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userPhone':
          result.userPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserFavoritiesStartupsRecord extends UserFavoritiesStartupsRecord {
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? startup;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? userName;
  @override
  final String? userPhone;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserFavoritiesStartupsRecord(
          [void Function(UserFavoritiesStartupsRecordBuilder)? updates]) =>
      (new UserFavoritiesStartupsRecordBuilder()..update(updates)).build();

  _$UserFavoritiesStartupsRecord._(
      {this.createDate,
      this.startup,
      this.user,
      this.userName,
      this.userPhone,
      this.ffRef})
      : super._();

  @override
  UserFavoritiesStartupsRecord rebuild(
          void Function(UserFavoritiesStartupsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserFavoritiesStartupsRecordBuilder toBuilder() =>
      new UserFavoritiesStartupsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserFavoritiesStartupsRecord &&
        createDate == other.createDate &&
        startup == other.startup &&
        user == other.user &&
        userName == other.userName &&
        userPhone == other.userPhone &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, createDate.hashCode), startup.hashCode),
                    user.hashCode),
                userName.hashCode),
            userPhone.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserFavoritiesStartupsRecord')
          ..add('createDate', createDate)
          ..add('startup', startup)
          ..add('user', user)
          ..add('userName', userName)
          ..add('userPhone', userPhone)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserFavoritiesStartupsRecordBuilder
    implements
        Builder<UserFavoritiesStartupsRecord,
            UserFavoritiesStartupsRecordBuilder> {
  _$UserFavoritiesStartupsRecord? _$v;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  DocumentReference<Object?>? _startup;
  DocumentReference<Object?>? get startup => _$this._startup;
  set startup(DocumentReference<Object?>? startup) => _$this._startup = startup;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _userPhone;
  String? get userPhone => _$this._userPhone;
  set userPhone(String? userPhone) => _$this._userPhone = userPhone;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserFavoritiesStartupsRecordBuilder() {
    UserFavoritiesStartupsRecord._initializeBuilder(this);
  }

  UserFavoritiesStartupsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _startup = $v.startup;
      _user = $v.user;
      _userName = $v.userName;
      _userPhone = $v.userPhone;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserFavoritiesStartupsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserFavoritiesStartupsRecord;
  }

  @override
  void update(void Function(UserFavoritiesStartupsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserFavoritiesStartupsRecord build() {
    final _$result = _$v ??
        new _$UserFavoritiesStartupsRecord._(
            createDate: createDate,
            startup: startup,
            user: user,
            userName: userName,
            userPhone: userPhone,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
