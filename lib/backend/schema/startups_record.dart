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

  String? get instagramUrl;

  String? get linkedinUrl;

  String? get pitchYoutubeUrl;

  String? get lastYearGrowth;

  String? get pitchPdfUrl;

  String? get state;

  String? get country;

  String? get employeeCount;

  int? get foundationYear;

  String? get site;

  String? get lastYearRevenue;

  String? get maturity;

  String? get clientsCount;

  String? get comercialName;

  String? get linkedinUrlCompany;

  String? get sectorsOfActivity;

  String? get feedNews;

  int? get comercialContact;

  String? get ceoName;

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
    ..instagramUrl = ''
    ..linkedinUrl = ''
    ..pitchYoutubeUrl = ''
    ..lastYearGrowth = ''
    ..pitchPdfUrl = ''
    ..state = ''
    ..country = ''
    ..employeeCount = ''
    ..foundationYear = 0
    ..site = ''
    ..lastYearRevenue = ''
    ..maturity = ''
    ..clientsCount = ''
    ..comercialName = ''
    ..linkedinUrlCompany = ''
    ..sectorsOfActivity = ''
    ..feedNews = ''
    ..comercialContact = 0
    ..ceoName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startups');

  static Stream<StartupsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StartupsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static StartupsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StartupsRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..category = snapshot.data['category']
          ..city = snapshot.data['city']
          ..valueProposalText = snapshot.data['valueProposalText']
          ..problemResolutionText = snapshot.data['problemResolutionText']
          ..customerNiche = snapshot.data['customerNiche']
          ..businessModel = snapshot.data['businessModel']
          ..logo = snapshot.data['logo']
          ..instagramUrl = snapshot.data['instagramUrl']
          ..linkedinUrl = snapshot.data['linkedinUrl']
          ..pitchYoutubeUrl = snapshot.data['pitchYoutubeUrl']
          ..lastYearGrowth = snapshot.data['lastYearGrowth']
          ..pitchPdfUrl = snapshot.data['pitchPdfUrl']
          ..state = snapshot.data['state']
          ..country = snapshot.data['country']
          ..employeeCount = snapshot.data['employeeCount']
          ..foundationYear = snapshot.data['foundationYear']?.round()
          ..site = snapshot.data['site']
          ..lastYearRevenue = snapshot.data['lastYearRevenue']
          ..maturity = snapshot.data['maturity']
          ..clientsCount = snapshot.data['clientsCount']
          ..comercialName = snapshot.data['comercialName']
          ..linkedinUrlCompany = snapshot.data['linkedinUrlCompany']
          ..sectorsOfActivity = snapshot.data['sectorsOfActivity']
          ..feedNews = snapshot.data['feedNews']
          ..comercialContact = snapshot.data['comercialContact']?.round()
          ..ceoName = snapshot.data['ceoName']
          ..ffRef = StartupsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StartupsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'startups',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  String? instagramUrl,
  String? linkedinUrl,
  String? pitchYoutubeUrl,
  String? lastYearGrowth,
  String? pitchPdfUrl,
  String? state,
  String? country,
  String? employeeCount,
  int? foundationYear,
  String? site,
  String? lastYearRevenue,
  String? maturity,
  String? clientsCount,
  String? comercialName,
  String? linkedinUrlCompany,
  String? sectorsOfActivity,
  String? feedNews,
  int? comercialContact,
  String? ceoName,
}) {
  final firestoreData = serializers.toFirestore(
    StartupsRecord.serializer,
    StartupsRecord(
      (s) => s
        ..name = name
        ..category = category
        ..city = city
        ..valueProposalText = valueProposalText
        ..problemResolutionText = problemResolutionText
        ..customerNiche = customerNiche
        ..businessModel = businessModel
        ..logo = logo
        ..instagramUrl = instagramUrl
        ..linkedinUrl = linkedinUrl
        ..pitchYoutubeUrl = pitchYoutubeUrl
        ..lastYearGrowth = lastYearGrowth
        ..pitchPdfUrl = pitchPdfUrl
        ..state = state
        ..country = country
        ..employeeCount = employeeCount
        ..foundationYear = foundationYear
        ..site = site
        ..lastYearRevenue = lastYearRevenue
        ..maturity = maturity
        ..clientsCount = clientsCount
        ..comercialName = comercialName
        ..linkedinUrlCompany = linkedinUrlCompany
        ..sectorsOfActivity = sectorsOfActivity
        ..feedNews = feedNews
        ..comercialContact = comercialContact
        ..ceoName = ceoName,
    ),
  );

  return firestoreData;
}
