import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_is_logged_record.g.dart';

abstract class UserIsLoggedRecord
    implements Built<UserIsLoggedRecord, UserIsLoggedRecordBuilder> {
  static Serializer<UserIsLoggedRecord> get serializer =>
      _$userIsLoggedRecordSerializer;

  DocumentReference? get user;

  String? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserIsLoggedRecordBuilder builder) =>
      builder..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userIsLogged');

  static Stream<UserIsLoggedRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserIsLoggedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserIsLoggedRecord._();
  factory UserIsLoggedRecord(
          [void Function(UserIsLoggedRecordBuilder) updates]) =
      _$UserIsLoggedRecord;

  static UserIsLoggedRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserIsLoggedRecordData({
  DocumentReference? user,
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    UserIsLoggedRecord.serializer,
    UserIsLoggedRecord(
      (u) => u
        ..user = user
        ..uid = uid,
    ),
  );

  return firestoreData;
}
