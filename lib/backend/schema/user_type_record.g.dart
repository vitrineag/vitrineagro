// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserTypeRecord> _$userTypeRecordSerializer =
    new _$UserTypeRecordSerializer();

class _$UserTypeRecordSerializer
    implements StructuredSerializer<UserTypeRecord> {
  @override
  final Iterable<Type> types = const [UserTypeRecord, _$UserTypeRecord];
  @override
  final String wireName = 'UserTypeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserTypeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  UserTypeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserTypeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$UserTypeRecord extends UserTypeRecord {
  @override
  final BuiltList<String>? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserTypeRecord([void Function(UserTypeRecordBuilder)? updates]) =>
      (new UserTypeRecordBuilder()..update(updates))._build();

  _$UserTypeRecord._({this.type, this.ffRef}) : super._();

  @override
  UserTypeRecord rebuild(void Function(UserTypeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserTypeRecordBuilder toBuilder() =>
      new UserTypeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserTypeRecord &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserTypeRecord')
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserTypeRecordBuilder
    implements Builder<UserTypeRecord, UserTypeRecordBuilder> {
  _$UserTypeRecord? _$v;

  ListBuilder<String>? _type;
  ListBuilder<String> get type => _$this._type ??= new ListBuilder<String>();
  set type(ListBuilder<String>? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserTypeRecordBuilder() {
    UserTypeRecord._initializeBuilder(this);
  }

  UserTypeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserTypeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserTypeRecord;
  }

  @override
  void update(void Function(UserTypeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserTypeRecord build() => _build();

  _$UserTypeRecord _build() {
    _$UserTypeRecord _$result;
    try {
      _$result =
          _$v ?? new _$UserTypeRecord._(type: _type?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserTypeRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
