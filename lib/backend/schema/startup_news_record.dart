import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'startup_news_record.g.dart';

abstract class StartupNewsRecord
    implements Built<StartupNewsRecord, StartupNewsRecordBuilder> {
  static Serializer<StartupNewsRecord> get serializer =>
      _$startupNewsRecordSerializer;

  String? get newsUrl;

  String? get siteName;

  String? get title;

  String? get startupSite;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StartupNewsRecordBuilder builder) => builder
    ..newsUrl = ''
    ..siteName = ''
    ..title = ''
    ..startupSite = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startupNews');

  static Stream<StartupNewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StartupNewsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StartupNewsRecord._();
  factory StartupNewsRecord([void Function(StartupNewsRecordBuilder) updates]) =
      _$StartupNewsRecord;

  static StartupNewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStartupNewsRecordData({
  String? newsUrl,
  String? siteName,
  String? title,
  String? startupSite,
}) {
  final firestoreData = serializers.toFirestore(
    StartupNewsRecord.serializer,
    StartupNewsRecord(
      (s) => s
        ..newsUrl = newsUrl
        ..siteName = siteName
        ..title = title
        ..startupSite = startupSite,
    ),
  );

  return firestoreData;
}
