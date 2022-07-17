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

  String? get businessModel;

  String? get logo;

  String? get facebookUrl;

  String? get instagramUrl;

  String? get linkedinUrl;

  String? get pitchYoutubeUrl;

  int? get clientsCount;

  String? get lastYearGrowth;

  String? get lastInvestmentReceived;

  String? get pitchPdfUrl;

  String? get state;

  String? get country;

  String? get employeeCount;

  int? get foundationYear;

  String? get site;

  BuiltList<String>? get sectorsOfActivity;

  String? get lastYearRevenue;

  String? get maturity;

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
    ..businessModel = ''
    ..logo = ''
    ..facebookUrl = ''
    ..instagramUrl = ''
    ..linkedinUrl = ''
    ..pitchYoutubeUrl = ''
    ..clientsCount = 0
    ..lastYearGrowth = ''
    ..lastInvestmentReceived = ''
    ..pitchPdfUrl = ''
    ..state = ''
    ..country = ''
    ..employeeCount = ''
    ..foundationYear = 0
    ..site = ''
    ..sectorsOfActivity = ListBuilder()
    ..lastYearRevenue = ''
    ..maturity = '';

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
  String? businessModel,
  String? logo,
  String? facebookUrl,
  String? instagramUrl,
  String? linkedinUrl,
  String? pitchYoutubeUrl,
  int? clientsCount,
  String? lastYearGrowth,
  String? lastInvestmentReceived,
  String? pitchPdfUrl,
  String? state,
  String? country,
  String? employeeCount,
  int? foundationYear,
  String? site,
  String? lastYearRevenue,
  String? maturity,
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
          ..businessModel = businessModel
          ..logo = logo
          ..facebookUrl = facebookUrl
          ..instagramUrl = instagramUrl
          ..linkedinUrl = linkedinUrl
          ..pitchYoutubeUrl = pitchYoutubeUrl
          ..clientsCount = clientsCount
          ..lastYearGrowth = lastYearGrowth
          ..lastInvestmentReceived = lastInvestmentReceived
          ..pitchPdfUrl = pitchPdfUrl
          ..state = state
          ..country = country
          ..employeeCount = employeeCount
          ..foundationYear = foundationYear
          ..site = site
          ..sectorsOfActivity = null
          ..lastYearRevenue = lastYearRevenue
          ..maturity = maturity));
