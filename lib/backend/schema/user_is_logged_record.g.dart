// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_is_logged_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserIsLoggedRecord> _$userIsLoggedRecordSerializer =
    new _$UserIsLoggedRecordSerializer();

class _$UserIsLoggedRecordSerializer
    implements StructuredSerializer<UserIsLoggedRecord> {
  @override
  final Iterable<Type> types = const [UserIsLoggedRecord, _$UserIsLoggedRecord];
  @override
  final String wireName = 'UserIsLoggedRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserIsLoggedRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
  UserIsLoggedRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserIsLoggedRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$UserIsLoggedRecord extends UserIsLoggedRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserIsLoggedRecord(
          [void Function(UserIsLoggedRecordBuilder)? updates]) =>
      (new UserIsLoggedRecordBuilder()..update(updates)).build();

  _$UserIsLoggedRecord._({this.user, this.uid, this.ffRef}) : super._();

  @override
  UserIsLoggedRecord rebuild(
          void Function(UserIsLoggedRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserIsLoggedRecordBuilder toBuilder() =>
      new UserIsLoggedRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserIsLoggedRecord &&
        user == other.user &&
        uid == other.uid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, user.hashCode), uid.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserIsLoggedRecord')
          ..add('user', user)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserIsLoggedRecordBuilder
    implements Builder<UserIsLoggedRecord, UserIsLoggedRecordBuilder> {
  _$UserIsLoggedRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserIsLoggedRecordBuilder() {
    UserIsLoggedRecord._initializeBuilder(this);
  }

  UserIsLoggedRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _uid = $v.uid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserIsLoggedRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserIsLoggedRecord;
  }

  @override
  void update(void Function(UserIsLoggedRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserIsLoggedRecord build() {
    final _$result =
        _$v ?? new _$UserIsLoggedRecord._(user: user, uid: uid, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
