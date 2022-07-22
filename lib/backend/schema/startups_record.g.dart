// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startups_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StartupsRecord> _$startupsRecordSerializer =
    new _$StartupsRecordSerializer();

class _$StartupsRecordSerializer
    implements StructuredSerializer<StartupsRecord> {
  @override
  final Iterable<Type> types = const [StartupsRecord, _$StartupsRecord];
  @override
  final String wireName = 'StartupsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StartupsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valueProposalText;
    if (value != null) {
      result
        ..add('valueProposalText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.problemResolutionText;
    if (value != null) {
      result
        ..add('problemResolutionText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerNiche;
    if (value != null) {
      result
        ..add('customerNiche')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.businessModel;
    if (value != null) {
      result
        ..add('businessModel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagramUrl;
    if (value != null) {
      result
        ..add('instagramUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkedinUrl;
    if (value != null) {
      result
        ..add('linkedinUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pitchYoutubeUrl;
    if (value != null) {
      result
        ..add('pitchYoutubeUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastYearGrowth;
    if (value != null) {
      result
        ..add('lastYearGrowth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pitchPdfUrl;
    if (value != null) {
      result
        ..add('pitchPdfUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.employeeCount;
    if (value != null) {
      result
        ..add('employeeCount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foundationYear;
    if (value != null) {
      result
        ..add('foundationYear')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.site;
    if (value != null) {
      result
        ..add('site')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastYearRevenue;
    if (value != null) {
      result
        ..add('lastYearRevenue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maturity;
    if (value != null) {
      result
        ..add('maturity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientsCount;
    if (value != null) {
      result
        ..add('clientsCount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comercialName;
    if (value != null) {
      result
        ..add('comercialName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkedinUrlCompany;
    if (value != null) {
      result
        ..add('linkedinUrlCompany')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sectorsOfActivity;
    if (value != null) {
      result
        ..add('sectorsOfActivity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.feedNews;
    if (value != null) {
      result
        ..add('feedNews')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comercialContact;
    if (value != null) {
      result
        ..add('comercialContact')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  StartupsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StartupsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valueProposalText':
          result.valueProposalText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'problemResolutionText':
          result.problemResolutionText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'customerNiche':
          result.customerNiche = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'businessModel':
          result.businessModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'instagramUrl':
          result.instagramUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'linkedinUrl':
          result.linkedinUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pitchYoutubeUrl':
          result.pitchYoutubeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastYearGrowth':
          result.lastYearGrowth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pitchPdfUrl':
          result.pitchPdfUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'employeeCount':
          result.employeeCount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'foundationYear':
          result.foundationYear = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'site':
          result.site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastYearRevenue':
          result.lastYearRevenue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maturity':
          result.maturity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clientsCount':
          result.clientsCount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comercialName':
          result.comercialName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'linkedinUrlCompany':
          result.linkedinUrlCompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sectorsOfActivity':
          result.sectorsOfActivity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'feedNews':
          result.feedNews = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comercialContact':
          result.comercialContact = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$StartupsRecord extends StartupsRecord {
  @override
  final String? name;
  @override
  final String? category;
  @override
  final String? city;
  @override
  final String? valueProposalText;
  @override
  final String? problemResolutionText;
  @override
  final String? customerNiche;
  @override
  final String? businessModel;
  @override
  final String? logo;
  @override
  final String? instagramUrl;
  @override
  final String? linkedinUrl;
  @override
  final String? pitchYoutubeUrl;
  @override
  final String? lastYearGrowth;
  @override
  final String? pitchPdfUrl;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? employeeCount;
  @override
  final int? foundationYear;
  @override
  final String? site;
  @override
  final String? lastYearRevenue;
  @override
  final String? maturity;
  @override
  final String? clientsCount;
  @override
  final String? comercialName;
  @override
  final String? linkedinUrlCompany;
  @override
  final String? sectorsOfActivity;
  @override
  final String? feedNews;
  @override
  final int? comercialContact;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StartupsRecord([void Function(StartupsRecordBuilder)? updates]) =>
      (new StartupsRecordBuilder()..update(updates)).build();

  _$StartupsRecord._(
      {this.name,
      this.category,
      this.city,
      this.valueProposalText,
      this.problemResolutionText,
      this.customerNiche,
      this.businessModel,
      this.logo,
      this.instagramUrl,
      this.linkedinUrl,
      this.pitchYoutubeUrl,
      this.lastYearGrowth,
      this.pitchPdfUrl,
      this.state,
      this.country,
      this.employeeCount,
      this.foundationYear,
      this.site,
      this.lastYearRevenue,
      this.maturity,
      this.clientsCount,
      this.comercialName,
      this.linkedinUrlCompany,
      this.sectorsOfActivity,
      this.feedNews,
      this.comercialContact,
      this.ffRef})
      : super._();

  @override
  StartupsRecord rebuild(void Function(StartupsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartupsRecordBuilder toBuilder() =>
      new StartupsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartupsRecord &&
        name == other.name &&
        category == other.category &&
        city == other.city &&
        valueProposalText == other.valueProposalText &&
        problemResolutionText == other.problemResolutionText &&
        customerNiche == other.customerNiche &&
        businessModel == other.businessModel &&
        logo == other.logo &&
        instagramUrl == other.instagramUrl &&
        linkedinUrl == other.linkedinUrl &&
        pitchYoutubeUrl == other.pitchYoutubeUrl &&
        lastYearGrowth == other.lastYearGrowth &&
        pitchPdfUrl == other.pitchPdfUrl &&
        state == other.state &&
        country == other.country &&
        employeeCount == other.employeeCount &&
        foundationYear == other.foundationYear &&
        site == other.site &&
        lastYearRevenue == other.lastYearRevenue &&
        maturity == other.maturity &&
        clientsCount == other.clientsCount &&
        comercialName == other.comercialName &&
        linkedinUrlCompany == other.linkedinUrlCompany &&
        sectorsOfActivity == other.sectorsOfActivity &&
        feedNews == other.feedNews &&
        comercialContact == other.comercialContact &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, name.hashCode), category.hashCode), city.hashCode), valueProposalText.hashCode), problemResolutionText.hashCode), customerNiche.hashCode), businessModel.hashCode), logo.hashCode),
                                                                                instagramUrl.hashCode),
                                                                            linkedinUrl.hashCode),
                                                                        pitchYoutubeUrl.hashCode),
                                                                    lastYearGrowth.hashCode),
                                                                pitchPdfUrl.hashCode),
                                                            state.hashCode),
                                                        country.hashCode),
                                                    employeeCount.hashCode),
                                                foundationYear.hashCode),
                                            site.hashCode),
                                        lastYearRevenue.hashCode),
                                    maturity.hashCode),
                                clientsCount.hashCode),
                            comercialName.hashCode),
                        linkedinUrlCompany.hashCode),
                    sectorsOfActivity.hashCode),
                feedNews.hashCode),
            comercialContact.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StartupsRecord')
          ..add('name', name)
          ..add('category', category)
          ..add('city', city)
          ..add('valueProposalText', valueProposalText)
          ..add('problemResolutionText', problemResolutionText)
          ..add('customerNiche', customerNiche)
          ..add('businessModel', businessModel)
          ..add('logo', logo)
          ..add('instagramUrl', instagramUrl)
          ..add('linkedinUrl', linkedinUrl)
          ..add('pitchYoutubeUrl', pitchYoutubeUrl)
          ..add('lastYearGrowth', lastYearGrowth)
          ..add('pitchPdfUrl', pitchPdfUrl)
          ..add('state', state)
          ..add('country', country)
          ..add('employeeCount', employeeCount)
          ..add('foundationYear', foundationYear)
          ..add('site', site)
          ..add('lastYearRevenue', lastYearRevenue)
          ..add('maturity', maturity)
          ..add('clientsCount', clientsCount)
          ..add('comercialName', comercialName)
          ..add('linkedinUrlCompany', linkedinUrlCompany)
          ..add('sectorsOfActivity', sectorsOfActivity)
          ..add('feedNews', feedNews)
          ..add('comercialContact', comercialContact)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StartupsRecordBuilder
    implements Builder<StartupsRecord, StartupsRecordBuilder> {
  _$StartupsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _valueProposalText;
  String? get valueProposalText => _$this._valueProposalText;
  set valueProposalText(String? valueProposalText) =>
      _$this._valueProposalText = valueProposalText;

  String? _problemResolutionText;
  String? get problemResolutionText => _$this._problemResolutionText;
  set problemResolutionText(String? problemResolutionText) =>
      _$this._problemResolutionText = problemResolutionText;

  String? _customerNiche;
  String? get customerNiche => _$this._customerNiche;
  set customerNiche(String? customerNiche) =>
      _$this._customerNiche = customerNiche;

  String? _businessModel;
  String? get businessModel => _$this._businessModel;
  set businessModel(String? businessModel) =>
      _$this._businessModel = businessModel;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  String? _instagramUrl;
  String? get instagramUrl => _$this._instagramUrl;
  set instagramUrl(String? instagramUrl) => _$this._instagramUrl = instagramUrl;

  String? _linkedinUrl;
  String? get linkedinUrl => _$this._linkedinUrl;
  set linkedinUrl(String? linkedinUrl) => _$this._linkedinUrl = linkedinUrl;

  String? _pitchYoutubeUrl;
  String? get pitchYoutubeUrl => _$this._pitchYoutubeUrl;
  set pitchYoutubeUrl(String? pitchYoutubeUrl) =>
      _$this._pitchYoutubeUrl = pitchYoutubeUrl;

  String? _lastYearGrowth;
  String? get lastYearGrowth => _$this._lastYearGrowth;
  set lastYearGrowth(String? lastYearGrowth) =>
      _$this._lastYearGrowth = lastYearGrowth;

  String? _pitchPdfUrl;
  String? get pitchPdfUrl => _$this._pitchPdfUrl;
  set pitchPdfUrl(String? pitchPdfUrl) => _$this._pitchPdfUrl = pitchPdfUrl;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _employeeCount;
  String? get employeeCount => _$this._employeeCount;
  set employeeCount(String? employeeCount) =>
      _$this._employeeCount = employeeCount;

  int? _foundationYear;
  int? get foundationYear => _$this._foundationYear;
  set foundationYear(int? foundationYear) =>
      _$this._foundationYear = foundationYear;

  String? _site;
  String? get site => _$this._site;
  set site(String? site) => _$this._site = site;

  String? _lastYearRevenue;
  String? get lastYearRevenue => _$this._lastYearRevenue;
  set lastYearRevenue(String? lastYearRevenue) =>
      _$this._lastYearRevenue = lastYearRevenue;

  String? _maturity;
  String? get maturity => _$this._maturity;
  set maturity(String? maturity) => _$this._maturity = maturity;

  String? _clientsCount;
  String? get clientsCount => _$this._clientsCount;
  set clientsCount(String? clientsCount) => _$this._clientsCount = clientsCount;

  String? _comercialName;
  String? get comercialName => _$this._comercialName;
  set comercialName(String? comercialName) =>
      _$this._comercialName = comercialName;

  String? _linkedinUrlCompany;
  String? get linkedinUrlCompany => _$this._linkedinUrlCompany;
  set linkedinUrlCompany(String? linkedinUrlCompany) =>
      _$this._linkedinUrlCompany = linkedinUrlCompany;

  String? _sectorsOfActivity;
  String? get sectorsOfActivity => _$this._sectorsOfActivity;
  set sectorsOfActivity(String? sectorsOfActivity) =>
      _$this._sectorsOfActivity = sectorsOfActivity;

  String? _feedNews;
  String? get feedNews => _$this._feedNews;
  set feedNews(String? feedNews) => _$this._feedNews = feedNews;

  int? _comercialContact;
  int? get comercialContact => _$this._comercialContact;
  set comercialContact(int? comercialContact) =>
      _$this._comercialContact = comercialContact;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StartupsRecordBuilder() {
    StartupsRecord._initializeBuilder(this);
  }

  StartupsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _category = $v.category;
      _city = $v.city;
      _valueProposalText = $v.valueProposalText;
      _problemResolutionText = $v.problemResolutionText;
      _customerNiche = $v.customerNiche;
      _businessModel = $v.businessModel;
      _logo = $v.logo;
      _instagramUrl = $v.instagramUrl;
      _linkedinUrl = $v.linkedinUrl;
      _pitchYoutubeUrl = $v.pitchYoutubeUrl;
      _lastYearGrowth = $v.lastYearGrowth;
      _pitchPdfUrl = $v.pitchPdfUrl;
      _state = $v.state;
      _country = $v.country;
      _employeeCount = $v.employeeCount;
      _foundationYear = $v.foundationYear;
      _site = $v.site;
      _lastYearRevenue = $v.lastYearRevenue;
      _maturity = $v.maturity;
      _clientsCount = $v.clientsCount;
      _comercialName = $v.comercialName;
      _linkedinUrlCompany = $v.linkedinUrlCompany;
      _sectorsOfActivity = $v.sectorsOfActivity;
      _feedNews = $v.feedNews;
      _comercialContact = $v.comercialContact;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StartupsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StartupsRecord;
  }

  @override
  void update(void Function(StartupsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StartupsRecord build() {
    final _$result = _$v ??
        new _$StartupsRecord._(
            name: name,
            category: category,
            city: city,
            valueProposalText: valueProposalText,
            problemResolutionText: problemResolutionText,
            customerNiche: customerNiche,
            businessModel: businessModel,
            logo: logo,
            instagramUrl: instagramUrl,
            linkedinUrl: linkedinUrl,
            pitchYoutubeUrl: pitchYoutubeUrl,
            lastYearGrowth: lastYearGrowth,
            pitchPdfUrl: pitchPdfUrl,
            state: state,
            country: country,
            employeeCount: employeeCount,
            foundationYear: foundationYear,
            site: site,
            lastYearRevenue: lastYearRevenue,
            maturity: maturity,
            clientsCount: clientsCount,
            comercialName: comercialName,
            linkedinUrlCompany: linkedinUrlCompany,
            sectorsOfActivity: sectorsOfActivity,
            feedNews: feedNews,
            comercialContact: comercialContact,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
