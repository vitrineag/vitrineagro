// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sectors_of_activity_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SectorsOfActivityRecord> _$sectorsOfActivityRecordSerializer =
    new _$SectorsOfActivityRecordSerializer();

class _$SectorsOfActivityRecordSerializer
    implements StructuredSerializer<SectorsOfActivityRecord> {
  @override
  final Iterable<Type> types = const [
    SectorsOfActivityRecord,
    _$SectorsOfActivityRecord
  ];
  @override
  final String wireName = 'SectorsOfActivityRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SectorsOfActivityRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
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
  SectorsOfActivityRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SectorsOfActivityRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
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

class _$SectorsOfActivityRecord extends SectorsOfActivityRecord {
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SectorsOfActivityRecord(
          [void Function(SectorsOfActivityRecordBuilder)? updates]) =>
      (new SectorsOfActivityRecordBuilder()..update(updates))._build();

  _$SectorsOfActivityRecord._({this.description, this.icon, this.ffRef})
      : super._();

  @override
  SectorsOfActivityRecord rebuild(
          void Function(SectorsOfActivityRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SectorsOfActivityRecordBuilder toBuilder() =>
      new SectorsOfActivityRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SectorsOfActivityRecord &&
        description == other.description &&
        icon == other.icon &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, description.hashCode), icon.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SectorsOfActivityRecord')
          ..add('description', description)
          ..add('icon', icon)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SectorsOfActivityRecordBuilder
    implements
        Builder<SectorsOfActivityRecord, SectorsOfActivityRecordBuilder> {
  _$SectorsOfActivityRecord? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SectorsOfActivityRecordBuilder() {
    SectorsOfActivityRecord._initializeBuilder(this);
  }

  SectorsOfActivityRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _icon = $v.icon;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SectorsOfActivityRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SectorsOfActivityRecord;
  }

  @override
  void update(void Function(SectorsOfActivityRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SectorsOfActivityRecord build() => _build();

  _$SectorsOfActivityRecord _build() {
    final _$result = _$v ??
        new _$SectorsOfActivityRecord._(
            description: description, icon: icon, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
