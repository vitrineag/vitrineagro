import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'startups_record.g.dart';

abstract class StartupsRecord
    implements Built<StartupsRecord, StartupsRecordBuilder> {
  static Serializer<StartupsRecord> get serializer =>
      _$startupsRecordSerializer;

  String? get name;

  String? get category;

  String? get city;

  String? get valueProposalText;

  String? get problemResolutionText;

  String? get customerNiche;

  String? get maturity;

  String? get businessModel;

  String? get logo;

  String? get facebookUrl;

  String? get instagramUrl;

  String? get linkedinUrl;

  String? get email;

  String? get pitchYoutubeUrl;

  int? get clientsCount;

  double? get lastYearRevenue;

  String? get lastYearGrowth;

  String? get lastInvestmentReceived;

  String? get pitchPdfUrl;

  String? get state;

  String? get country;

  String? get employeeCount;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StartupsRecordBuilder builder) => builder
    ..name = ''
    ..category = ''
    ..city = ''
    ..valueProposalText = ''
    ..problemResolutionText = ''
    ..customerNiche = ''
    ..maturity = ''
    ..businessModel = ''
    ..logo = ''
    ..facebookUrl = ''
    ..instagramUrl = ''
    ..linkedinUrl = ''
    ..email = ''
    ..pitchYoutubeUrl = ''
    ..clientsCount = 0
    ..lastYearRevenue = 0.0
    ..lastYearGrowth = ''
    ..lastInvestmentReceived = ''
    ..pitchPdfUrl = ''
    ..state = ''
    ..country = ''
    ..employeeCount = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startups');

  static Stream<StartupsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StartupsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StartupsRecord._();
  factory StartupsRecord([void Function(StartupsRecordBuilder) updates]) =
      _$StartupsRecord;

  static StartupsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStartupsRecordData({
  String? name,
  String? category,
  String? city,
  String? valueProposalText,
  String? problemResolutionText,
  String? customerNiche,
  String? maturity,
  String? businessModel,
  String? logo,
  String? facebookUrl,
  String? instagramUrl,
  String? linkedinUrl,
  String? email,
  String? pitchYoutubeUrl,
  int? clientsCount,
  double? lastYearRevenue,
  String? lastYearGrowth,
  String? lastInvestmentReceived,
  String? pitchPdfUrl,
  String? state,
  String? country,
  String? employeeCount,
}) =>
    serializers.toFirestore(
        StartupsRecord.serializer,
        StartupsRecord((s) => s
          ..name = name
          ..category = category
          ..city = city
          ..valueProposalText = valueProposalText
          ..problemResolutionText = problemResolutionText
          ..customerNiche = customerNiche
          ..maturity = maturity
          ..businessModel = businessModel
          ..logo = logo
          ..facebookUrl = facebookUrl
          ..instagramUrl = instagramUrl
          ..linkedinUrl = linkedinUrl
          ..email = email
          ..pitchYoutubeUrl = pitchYoutubeUrl
          ..clientsCount = clientsCount
          ..lastYearRevenue = lastYearRevenue
          ..lastYearGrowth = lastYearGrowth
          ..lastInvestmentReceived = lastInvestmentReceived
          ..pitchPdfUrl = pitchPdfUrl
          ..state = state
          ..country = country
          ..employeeCount = employeeCount));
