import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_contact_record.g.dart';

abstract class UserContactRecord
    implements Built<UserContactRecord, UserContactRecordBuilder> {
  static Serializer<UserContactRecord> get serializer =>
      _$userContactRecordSerializer;

  DateTime? get createdDate;

  DocumentReference? get startup;

  String? get startupContact;

  String? get startupName;

  DocumentReference? get user;

  String? get userEmail;

  String? get userName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserContactRecordBuilder builder) => builder
    ..startupContact = ''
    ..startupName = ''
    ..userEmail = ''
    ..userName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userContact');

  static Stream<UserContactRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserContactRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserContactRecord._();
  factory UserContactRecord([void Function(UserContactRecordBuilder) updates]) =
      _$UserContactRecord;

  static UserContactRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserContactRecordData({
  DateTime? createdDate,
  DocumentReference? startup,
  String? startupContact,
  String? startupName,
  DocumentReference? user,
  String? userEmail,
  String? userName,
}) {
  final firestoreData = serializers.toFirestore(
    UserContactRecord.serializer,
    UserContactRecord(
      (u) => u
        ..createdDate = createdDate
        ..startup = startup
        ..startupContact = startupContact
        ..startupName = startupName
        ..user = user
        ..userEmail = userEmail
        ..userName = userName,
    ),
  );

  return firestoreData;
}
