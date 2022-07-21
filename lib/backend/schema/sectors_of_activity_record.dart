import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sectors_of_activity_record.g.dart';

abstract class SectorsOfActivityRecord
    implements Built<SectorsOfActivityRecord, SectorsOfActivityRecordBuilder> {
  static Serializer<SectorsOfActivityRecord> get serializer =>
      _$sectorsOfActivityRecordSerializer;

  String? get description;

  String? get icone;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SectorsOfActivityRecordBuilder builder) =>
      builder
        ..description = ''
        ..icone = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sectorsOfActivity');

  static Stream<SectorsOfActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SectorsOfActivityRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SectorsOfActivityRecord._();
  factory SectorsOfActivityRecord(
          [void Function(SectorsOfActivityRecordBuilder) updates]) =
      _$SectorsOfActivityRecord;

  static SectorsOfActivityRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSectorsOfActivityRecordData({
  String? description,
  String? icone,
}) {
  final firestoreData = serializers.toFirestore(
    SectorsOfActivityRecord.serializer,
    SectorsOfActivityRecord(
      (s) => s
        ..description = description
        ..icone = icone,
    ),
  );

  return firestoreData;
}
