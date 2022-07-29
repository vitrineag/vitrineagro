import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'startup_tracking_record.g.dart';

abstract class StartupTrackingRecord
    implements Built<StartupTrackingRecord, StartupTrackingRecordBuilder> {
  static Serializer<StartupTrackingRecord> get serializer =>
      _$startupTrackingRecordSerializer;

  String? get startupName;

  int? get views;

  int? get share;

  int? get favorited;

  int? get enterInContact;

  int? get accessSite;

  int? get accessLinkedin;

  int? get accessLinkedinCeo;

  int? get accessFeedOne;

  int? get accessFeedTwo;

  int? get accessFeedThree;

  int? get interactMilestones;

  String? get startupSite;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StartupTrackingRecordBuilder builder) =>
      builder
        ..startupName = ''
        ..views = 0
        ..share = 0
        ..favorited = 0
        ..enterInContact = 0
        ..accessSite = 0
        ..accessLinkedin = 0
        ..accessLinkedinCeo = 0
        ..accessFeedOne = 0
        ..accessFeedTwo = 0
        ..accessFeedThree = 0
        ..interactMilestones = 0
        ..startupSite = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startupTracking');

  static Stream<StartupTrackingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StartupTrackingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StartupTrackingRecord._();
  factory StartupTrackingRecord(
          [void Function(StartupTrackingRecordBuilder) updates]) =
      _$StartupTrackingRecord;

  static StartupTrackingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStartupTrackingRecordData({
  String? startupName,
  int? views,
  int? share,
  int? favorited,
  int? enterInContact,
  int? accessSite,
  int? accessLinkedin,
  int? accessLinkedinCeo,
  int? accessFeedOne,
  int? accessFeedTwo,
  int? accessFeedThree,
  int? interactMilestones,
  String? startupSite,
}) {
  final firestoreData = serializers.toFirestore(
    StartupTrackingRecord.serializer,
    StartupTrackingRecord(
      (s) => s
        ..startupName = startupName
        ..views = views
        ..share = share
        ..favorited = favorited
        ..enterInContact = enterInContact
        ..accessSite = accessSite
        ..accessLinkedin = accessLinkedin
        ..accessLinkedinCeo = accessLinkedinCeo
        ..accessFeedOne = accessFeedOne
        ..accessFeedTwo = accessFeedTwo
        ..accessFeedThree = accessFeedThree
        ..interactMilestones = interactMilestones
        ..startupSite = startupSite,
    ),
  );

  return firestoreData;
}
