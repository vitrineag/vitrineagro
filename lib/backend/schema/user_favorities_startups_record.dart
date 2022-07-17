import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_favorities_startups_record.g.dart';

abstract class UserFavoritiesStartupsRecord
    implements
        Built<UserFavoritiesStartupsRecord,
            UserFavoritiesStartupsRecordBuilder> {
  static Serializer<UserFavoritiesStartupsRecord> get serializer =>
      _$userFavoritiesStartupsRecordSerializer;

  DateTime? get createDate;

  DocumentReference? get startup;

  DocumentReference? get user;

  String? get userName;

  String? get userPhone;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserFavoritiesStartupsRecordBuilder builder) =>
      builder
        ..userName = ''
        ..userPhone = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userFavoritiesStartups');

  static Stream<UserFavoritiesStartupsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserFavoritiesStartupsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserFavoritiesStartupsRecord._();
  factory UserFavoritiesStartupsRecord(
          [void Function(UserFavoritiesStartupsRecordBuilder) updates]) =
      _$UserFavoritiesStartupsRecord;

  static UserFavoritiesStartupsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserFavoritiesStartupsRecordData({
  DateTime? createDate,
  DocumentReference? startup,
  DocumentReference? user,
  String? userName,
  String? userPhone,
}) =>
    serializers.toFirestore(
        UserFavoritiesStartupsRecord.serializer,
        UserFavoritiesStartupsRecord((u) => u
          ..createDate = createDate
          ..startup = startup
          ..user = user
          ..userName = userName
          ..userPhone = userPhone));
