// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_contact_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserContactRecord> _$userContactRecordSerializer =
    new _$UserContactRecordSerializer();

class _$UserContactRecordSerializer
    implements StructuredSerializer<UserContactRecord> {
  @override
  final Iterable<Type> types = const [UserContactRecord, _$UserContactRecord];
  @override
  final String wireName = 'UserContactRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserContactRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
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
    value = object.startupContact;
    if (value != null) {
      result
        ..add('startupContact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startupName;
    if (value != null) {
      result
        ..add('startupName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userEmail;
    if (value != null) {
      result
        ..add('userEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('userName')
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
  UserContactRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserContactRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'startup':
          result.startup = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'startupContact':
          result.startupContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'startupName':
          result.startupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userEmail':
          result.userEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
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

class _$UserContactRecord extends UserContactRecord {
  @override
  final DateTime? createdDate;
  @override
  final DocumentReference<Object?>? startup;
  @override
  final String? startupContact;
  @override
  final String? startupName;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? userEmail;
  @override
  final String? userName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserContactRecord(
          [void Function(UserContactRecordBuilder)? updates]) =>
      (new UserContactRecordBuilder()..update(updates)).build();

  _$UserContactRecord._(
      {this.createdDate,
      this.startup,
      this.startupContact,
      this.startupName,
      this.user,
      this.userEmail,
      this.userName,
      this.ffRef})
      : super._();

  @override
  UserContactRecord rebuild(void Function(UserContactRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserContactRecordBuilder toBuilder() =>
      new UserContactRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserContactRecord &&
        createdDate == other.createdDate &&
        startup == other.startup &&
        startupContact == other.startupContact &&
        startupName == other.startupName &&
        user == other.user &&
        userEmail == other.userEmail &&
        userName == other.userName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, createdDate.hashCode), startup.hashCode),
                            startupContact.hashCode),
                        startupName.hashCode),
                    user.hashCode),
                userEmail.hashCode),
            userName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserContactRecord')
          ..add('createdDate', createdDate)
          ..add('startup', startup)
          ..add('startupContact', startupContact)
          ..add('startupName', startupName)
          ..add('user', user)
          ..add('userEmail', userEmail)
          ..add('userName', userName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserContactRecordBuilder
    implements Builder<UserContactRecord, UserContactRecordBuilder> {
  _$UserContactRecord? _$v;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object?>? _startup;
  DocumentReference<Object?>? get startup => _$this._startup;
  set startup(DocumentReference<Object?>? startup) => _$this._startup = startup;

  String? _startupContact;
  String? get startupContact => _$this._startupContact;
  set startupContact(String? startupContact) =>
      _$this._startupContact = startupContact;

  String? _startupName;
  String? get startupName => _$this._startupName;
  set startupName(String? startupName) => _$this._startupName = startupName;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _userEmail;
  String? get userEmail => _$this._userEmail;
  set userEmail(String? userEmail) => _$this._userEmail = userEmail;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserContactRecordBuilder() {
    UserContactRecord._initializeBuilder(this);
  }

  UserContactRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdDate = $v.createdDate;
      _startup = $v.startup;
      _startupContact = $v.startupContact;
      _startupName = $v.startupName;
      _user = $v.user;
      _userEmail = $v.userEmail;
      _userName = $v.userName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserContactRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserContactRecord;
  }

  @override
  void update(void Function(UserContactRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserContactRecord build() {
    final _$result = _$v ??
        new _$UserContactRecord._(
            createdDate: createdDate,
            startup: startup,
            startupContact: startupContact,
            startupName: startupName,
            user: user,
            userEmail: userEmail,
            userName: userName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
