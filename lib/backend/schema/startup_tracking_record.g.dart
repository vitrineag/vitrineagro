// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_tracking_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StartupTrackingRecord> _$startupTrackingRecordSerializer =
    new _$StartupTrackingRecordSerializer();

class _$StartupTrackingRecordSerializer
    implements StructuredSerializer<StartupTrackingRecord> {
  @override
  final Iterable<Type> types = const [
    StartupTrackingRecord,
    _$StartupTrackingRecord
  ];
  @override
  final String wireName = 'StartupTrackingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, StartupTrackingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.startupName;
    if (value != null) {
      result
        ..add('startupName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.views;
    if (value != null) {
      result
        ..add('views')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.share;
    if (value != null) {
      result
        ..add('share')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.favorited;
    if (value != null) {
      result
        ..add('favorited')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.enterInContact;
    if (value != null) {
      result
        ..add('enterInContact')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accessSite;
    if (value != null) {
      result
        ..add('accessSite')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accessLinkedin;
    if (value != null) {
      result
        ..add('accessLinkedin')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accessLinkedinCeo;
    if (value != null) {
      result
        ..add('accessLinkedinCeo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accessFeedOne;
    if (value != null) {
      result
        ..add('accessFeedOne')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accessFeedTwo;
    if (value != null) {
      result
        ..add('accessFeedTwo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accessFeedThree;
    if (value != null) {
      result
        ..add('accessFeedThree')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.interactMilestones;
    if (value != null) {
      result
        ..add('interactMilestones')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  StartupTrackingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StartupTrackingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'startupName':
          result.startupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'share':
          result.share = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'favorited':
          result.favorited = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'enterInContact':
          result.enterInContact = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'accessSite':
          result.accessSite = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'accessLinkedin':
          result.accessLinkedin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'accessLinkedinCeo':
          result.accessLinkedinCeo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'accessFeedOne':
          result.accessFeedOne = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'accessFeedTwo':
          result.accessFeedTwo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'accessFeedThree':
          result.accessFeedThree = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'interactMilestones':
          result.interactMilestones = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$StartupTrackingRecord extends StartupTrackingRecord {
  @override
  final String? startupName;
  @override
  final int? views;
  @override
  final int? share;
  @override
  final int? favorited;
  @override
  final int? enterInContact;
  @override
  final int? accessSite;
  @override
  final int? accessLinkedin;
  @override
  final int? accessLinkedinCeo;
  @override
  final int? accessFeedOne;
  @override
  final int? accessFeedTwo;
  @override
  final int? accessFeedThree;
  @override
  final int? interactMilestones;
  @override
  final String? startupSite;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StartupTrackingRecord(
          [void Function(StartupTrackingRecordBuilder)? updates]) =>
      (new StartupTrackingRecordBuilder()..update(updates))._build();

  _$StartupTrackingRecord._(
      {this.startupName,
      this.views,
      this.share,
      this.favorited,
      this.enterInContact,
      this.accessSite,
      this.accessLinkedin,
      this.accessLinkedinCeo,
      this.accessFeedOne,
      this.accessFeedTwo,
      this.accessFeedThree,
      this.interactMilestones,
      this.startupSite,
      this.ffRef})
      : super._();

  @override
  StartupTrackingRecord rebuild(
          void Function(StartupTrackingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartupTrackingRecordBuilder toBuilder() =>
      new StartupTrackingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartupTrackingRecord &&
        startupName == other.startupName &&
        views == other.views &&
        share == other.share &&
        favorited == other.favorited &&
        enterInContact == other.enterInContact &&
        accessSite == other.accessSite &&
        accessLinkedin == other.accessLinkedin &&
        accessLinkedinCeo == other.accessLinkedinCeo &&
        accessFeedOne == other.accessFeedOne &&
        accessFeedTwo == other.accessFeedTwo &&
        accessFeedThree == other.accessFeedThree &&
        interactMilestones == other.interactMilestones &&
        startupSite == other.startupSite &&
        ffRef == other.ffRef;
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
                                                            0,
                                                            startupName
                                                                .hashCode),
                                                        views.hashCode),
                                                    share.hashCode),
                                                favorited.hashCode),
                                            enterInContact.hashCode),
                                        accessSite.hashCode),
                                    accessLinkedin.hashCode),
                                accessLinkedinCeo.hashCode),
                            accessFeedOne.hashCode),
                        accessFeedTwo.hashCode),
                    accessFeedThree.hashCode),
                interactMilestones.hashCode),
            startupSite.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StartupTrackingRecord')
          ..add('startupName', startupName)
          ..add('views', views)
          ..add('share', share)
          ..add('favorited', favorited)
          ..add('enterInContact', enterInContact)
          ..add('accessSite', accessSite)
          ..add('accessLinkedin', accessLinkedin)
          ..add('accessLinkedinCeo', accessLinkedinCeo)
          ..add('accessFeedOne', accessFeedOne)
          ..add('accessFeedTwo', accessFeedTwo)
          ..add('accessFeedThree', accessFeedThree)
          ..add('interactMilestones', interactMilestones)
          ..add('startupSite', startupSite)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StartupTrackingRecordBuilder
    implements Builder<StartupTrackingRecord, StartupTrackingRecordBuilder> {
  _$StartupTrackingRecord? _$v;

  String? _startupName;
  String? get startupName => _$this._startupName;
  set startupName(String? startupName) => _$this._startupName = startupName;

  int? _views;
  int? get views => _$this._views;
  set views(int? views) => _$this._views = views;

  int? _share;
  int? get share => _$this._share;
  set share(int? share) => _$this._share = share;

  int? _favorited;
  int? get favorited => _$this._favorited;
  set favorited(int? favorited) => _$this._favorited = favorited;

  int? _enterInContact;
  int? get enterInContact => _$this._enterInContact;
  set enterInContact(int? enterInContact) =>
      _$this._enterInContact = enterInContact;

  int? _accessSite;
  int? get accessSite => _$this._accessSite;
  set accessSite(int? accessSite) => _$this._accessSite = accessSite;

  int? _accessLinkedin;
  int? get accessLinkedin => _$this._accessLinkedin;
  set accessLinkedin(int? accessLinkedin) =>
      _$this._accessLinkedin = accessLinkedin;

  int? _accessLinkedinCeo;
  int? get accessLinkedinCeo => _$this._accessLinkedinCeo;
  set accessLinkedinCeo(int? accessLinkedinCeo) =>
      _$this._accessLinkedinCeo = accessLinkedinCeo;

  int? _accessFeedOne;
  int? get accessFeedOne => _$this._accessFeedOne;
  set accessFeedOne(int? accessFeedOne) =>
      _$this._accessFeedOne = accessFeedOne;

  int? _accessFeedTwo;
  int? get accessFeedTwo => _$this._accessFeedTwo;
  set accessFeedTwo(int? accessFeedTwo) =>
      _$this._accessFeedTwo = accessFeedTwo;

  int? _accessFeedThree;
  int? get accessFeedThree => _$this._accessFeedThree;
  set accessFeedThree(int? accessFeedThree) =>
      _$this._accessFeedThree = accessFeedThree;

  int? _interactMilestones;
  int? get interactMilestones => _$this._interactMilestones;
  set interactMilestones(int? interactMilestones) =>
      _$this._interactMilestones = interactMilestones;

  String? _startupSite;
  String? get startupSite => _$this._startupSite;
  set startupSite(String? startupSite) => _$this._startupSite = startupSite;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StartupTrackingRecordBuilder() {
    StartupTrackingRecord._initializeBuilder(this);
  }

  StartupTrackingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startupName = $v.startupName;
      _views = $v.views;
      _share = $v.share;
      _favorited = $v.favorited;
      _enterInContact = $v.enterInContact;
      _accessSite = $v.accessSite;
      _accessLinkedin = $v.accessLinkedin;
      _accessLinkedinCeo = $v.accessLinkedinCeo;
      _accessFeedOne = $v.accessFeedOne;
      _accessFeedTwo = $v.accessFeedTwo;
      _accessFeedThree = $v.accessFeedThree;
      _interactMilestones = $v.interactMilestones;
      _startupSite = $v.startupSite;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StartupTrackingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StartupTrackingRecord;
  }

  @override
  void update(void Function(StartupTrackingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StartupTrackingRecord build() => _build();

  _$StartupTrackingRecord _build() {
    final _$result = _$v ??
        new _$StartupTrackingRecord._(
            startupName: startupName,
            views: views,
            share: share,
            favorited: favorited,
            enterInContact: enterInContact,
            accessSite: accessSite,
            accessLinkedin: accessLinkedin,
            accessLinkedinCeo: accessLinkedinCeo,
            accessFeedOne: accessFeedOne,
            accessFeedTwo: accessFeedTwo,
            accessFeedThree: accessFeedThree,
            interactMilestones: interactMilestones,
            startupSite: startupSite,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
