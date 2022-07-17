import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_type_record.g.dart';

abstract class UserTypeRecord
    implements Built<UserTypeRecord, UserTypeRecordBuilder> {
  static Serializer<UserTypeRecord> get serializer =>
      _$userTypeRecordSerializer;

  BuiltList<String>? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserTypeRecordBuilder builder) =>
      builder..type = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userType');

  static Stream<UserTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserTypeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserTypeRecord._();
  factory UserTypeRecord([void Function(UserTypeRecordBuilder) updates]) =
      _$UserTypeRecord;

  static UserTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserTypeRecordData() => serializers.toFirestore(
    UserTypeRecord.serializer, UserTypeRecord((u) => u..type = null));
