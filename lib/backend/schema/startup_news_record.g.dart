// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_news_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StartupNewsRecord> _$startupNewsRecordSerializer =
    new _$StartupNewsRecordSerializer();

class _$StartupNewsRecordSerializer
    implements StructuredSerializer<StartupNewsRecord> {
  @override
  final Iterable<Type> types = const [StartupNewsRecord, _$StartupNewsRecord];
  @override
  final String wireName = 'StartupNewsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StartupNewsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.newsUrl;
    if (value != null) {
      result
        ..add('newsUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.siteName;
    if (value != null) {
      result
        ..add('siteName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startupSite;
    if (value != null) {
      result
        ..add('startupSite')
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
  StartupNewsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StartupNewsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'newsUrl':
          result.newsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'siteName':
          result.siteName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'startupSite':
          result.startupSite = serializers.deserialize(value,
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

class _$StartupNewsRecord extends StartupNewsRecord {
  @override
  final String? newsUrl;
  @override
  final String? siteName;
  @override
  final String? title;
  @override
  final String? startupSite;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StartupNewsRecord(
          [void Function(StartupNewsRecordBuilder)? updates]) =>
      (new StartupNewsRecordBuilder()..update(updates))._build();

  _$StartupNewsRecord._(
      {this.newsUrl, this.siteName, this.title, this.startupSite, this.ffRef})
      : super._();

  @override
  StartupNewsRecord rebuild(void Function(StartupNewsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartupNewsRecordBuilder toBuilder() =>
      new StartupNewsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartupNewsRecord &&
        newsUrl == other.newsUrl &&
        siteName == other.siteName &&
        title == other.title &&
        startupSite == other.startupSite &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, newsUrl.hashCode), siteName.hashCode),
                title.hashCode),
            startupSite.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StartupNewsRecord')
          ..add('newsUrl', newsUrl)
          ..add('siteName', siteName)
          ..add('title', title)
          ..add('startupSite', startupSite)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StartupNewsRecordBuilder
    implements Builder<StartupNewsRecord, StartupNewsRecordBuilder> {
  _$StartupNewsRecord? _$v;

  String? _newsUrl;
  String? get newsUrl => _$this._newsUrl;
  set newsUrl(String? newsUrl) => _$this._newsUrl = newsUrl;

  String? _siteName;
  String? get siteName => _$this._siteName;
  set siteName(String? siteName) => _$this._siteName = siteName;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _startupSite;
  String? get startupSite => _$this._startupSite;
  set startupSite(String? startupSite) => _$this._startupSite = startupSite;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StartupNewsRecordBuilder() {
    StartupNewsRecord._initializeBuilder(this);
  }

  StartupNewsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newsUrl = $v.newsUrl;
      _siteName = $v.siteName;
      _title = $v.title;
      _startupSite = $v.startupSite;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StartupNewsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StartupNewsRecord;
  }

  @override
  void update(void Function(StartupNewsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StartupNewsRecord build() => _build();

  _$StartupNewsRecord _build() {
    final _$result = _$v ??
        new _$StartupNewsRecord._(
            newsUrl: newsUrl,
            siteName: siteName,
            title: title,
            startupSite: startupSite,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
