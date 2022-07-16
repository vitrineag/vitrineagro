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
    value = object.maturity;
    if (value != null) {
      result
        ..add('maturity')
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
    value = object.facebookUrl;
    if (value != null) {
      result
        ..add('facebookUrl')
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.clientsCount;
    if (value != null) {
      result
        ..add('clientsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lastYearRevenue;
    if (value != null) {
      result
        ..add('lastYearRevenue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lastYearGrowth;
    if (value != null) {
      result
        ..add('lastYearGrowth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastInvestmentReceived;
    if (value != null) {
      result
        ..add('lastInvestmentReceived')
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
        case 'maturity':
          result.maturity = serializers.deserialize(value,
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
        case 'facebookUrl':
          result.facebookUrl = serializers.deserialize(value,
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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pitchYoutubeUrl':
          result.pitchYoutubeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clientsCount':
          result.clientsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lastYearRevenue':
          result.lastYearRevenue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lastYearGrowth':
          result.lastYearGrowth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastInvestmentReceived':
          result.lastInvestmentReceived = serializers.deserialize(value,
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
  final String? maturity;
  @override
  final String? businessModel;
  @override
  final String? logo;
  @override
  final String? facebookUrl;
  @override
  final String? instagramUrl;
  @override
  final String? linkedinUrl;
  @override
  final String? email;
  @override
  final String? pitchYoutubeUrl;
  @override
  final int? clientsCount;
  @override
  final double? lastYearRevenue;
  @override
  final String? lastYearGrowth;
  @override
  final String? lastInvestmentReceived;
  @override
  final String? pitchPdfUrl;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? employeeCount;
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
      this.maturity,
      this.businessModel,
      this.logo,
      this.facebookUrl,
      this.instagramUrl,
      this.linkedinUrl,
      this.email,
      this.pitchYoutubeUrl,
      this.clientsCount,
      this.lastYearRevenue,
      this.lastYearGrowth,
      this.lastInvestmentReceived,
      this.pitchPdfUrl,
      this.state,
      this.country,
      this.employeeCount,
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
        maturity == other.maturity &&
        businessModel == other.businessModel &&
        logo == other.logo &&
        facebookUrl == other.facebookUrl &&
        instagramUrl == other.instagramUrl &&
        linkedinUrl == other.linkedinUrl &&
        email == other.email &&
        pitchYoutubeUrl == other.pitchYoutubeUrl &&
        clientsCount == other.clientsCount &&
        lastYearRevenue == other.lastYearRevenue &&
        lastYearGrowth == other.lastYearGrowth &&
        lastInvestmentReceived == other.lastInvestmentReceived &&
        pitchPdfUrl == other.pitchPdfUrl &&
        state == other.state &&
        country == other.country &&
        employeeCount == other.employeeCount &&
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
                                                                            $jc($jc($jc($jc($jc(0, name.hashCode), category.hashCode), city.hashCode), valueProposalText.hashCode),
                                                                                problemResolutionText.hashCode),
                                                                            customerNiche.hashCode),
                                                                        maturity.hashCode),
                                                                    businessModel.hashCode),
                                                                logo.hashCode),
                                                            facebookUrl.hashCode),
                                                        instagramUrl.hashCode),
                                                    linkedinUrl.hashCode),
                                                email.hashCode),
                                            pitchYoutubeUrl.hashCode),
                                        clientsCount.hashCode),
                                    lastYearRevenue.hashCode),
                                lastYearGrowth.hashCode),
                            lastInvestmentReceived.hashCode),
                        pitchPdfUrl.hashCode),
                    state.hashCode),
                country.hashCode),
            employeeCount.hashCode),
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
          ..add('maturity', maturity)
          ..add('businessModel', businessModel)
          ..add('logo', logo)
          ..add('facebookUrl', facebookUrl)
          ..add('instagramUrl', instagramUrl)
          ..add('linkedinUrl', linkedinUrl)
          ..add('email', email)
          ..add('pitchYoutubeUrl', pitchYoutubeUrl)
          ..add('clientsCount', clientsCount)
          ..add('lastYearRevenue', lastYearRevenue)
          ..add('lastYearGrowth', lastYearGrowth)
          ..add('lastInvestmentReceived', lastInvestmentReceived)
          ..add('pitchPdfUrl', pitchPdfUrl)
          ..add('state', state)
          ..add('country', country)
          ..add('employeeCount', employeeCount)
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

  String? _maturity;
  String? get maturity => _$this._maturity;
  set maturity(String? maturity) => _$this._maturity = maturity;

  String? _businessModel;
  String? get businessModel => _$this._businessModel;
  set businessModel(String? businessModel) =>
      _$this._businessModel = businessModel;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  String? _facebookUrl;
  String? get facebookUrl => _$this._facebookUrl;
  set facebookUrl(String? facebookUrl) => _$this._facebookUrl = facebookUrl;

  String? _instagramUrl;
  String? get instagramUrl => _$this._instagramUrl;
  set instagramUrl(String? instagramUrl) => _$this._instagramUrl = instagramUrl;

  String? _linkedinUrl;
  String? get linkedinUrl => _$this._linkedinUrl;
  set linkedinUrl(String? linkedinUrl) => _$this._linkedinUrl = linkedinUrl;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _pitchYoutubeUrl;
  String? get pitchYoutubeUrl => _$this._pitchYoutubeUrl;
  set pitchYoutubeUrl(String? pitchYoutubeUrl) =>
      _$this._pitchYoutubeUrl = pitchYoutubeUrl;

  int? _clientsCount;
  int? get clientsCount => _$this._clientsCount;
  set clientsCount(int? clientsCount) => _$this._clientsCount = clientsCount;

  double? _lastYearRevenue;
  double? get lastYearRevenue => _$this._lastYearRevenue;
  set lastYearRevenue(double? lastYearRevenue) =>
      _$this._lastYearRevenue = lastYearRevenue;

  String? _lastYearGrowth;
  String? get lastYearGrowth => _$this._lastYearGrowth;
  set lastYearGrowth(String? lastYearGrowth) =>
      _$this._lastYearGrowth = lastYearGrowth;

  String? _lastInvestmentReceived;
  String? get lastInvestmentReceived => _$this._lastInvestmentReceived;
  set lastInvestmentReceived(String? lastInvestmentReceived) =>
      _$this._lastInvestmentReceived = lastInvestmentReceived;

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
      _maturity = $v.maturity;
      _businessModel = $v.businessModel;
      _logo = $v.logo;
      _facebookUrl = $v.facebookUrl;
      _instagramUrl = $v.instagramUrl;
      _linkedinUrl = $v.linkedinUrl;
      _email = $v.email;
      _pitchYoutubeUrl = $v.pitchYoutubeUrl;
      _clientsCount = $v.clientsCount;
      _lastYearRevenue = $v.lastYearRevenue;
      _lastYearGrowth = $v.lastYearGrowth;
      _lastInvestmentReceived = $v.lastInvestmentReceived;
      _pitchPdfUrl = $v.pitchPdfUrl;
      _state = $v.state;
      _country = $v.country;
      _employeeCount = $v.employeeCount;
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
            maturity: maturity,
            businessModel: businessModel,
            logo: logo,
            facebookUrl: facebookUrl,
            instagramUrl: instagramUrl,
            linkedinUrl: linkedinUrl,
            email: email,
            pitchYoutubeUrl: pitchYoutubeUrl,
            clientsCount: clientsCount,
            lastYearRevenue: lastYearRevenue,
            lastYearGrowth: lastYearGrowth,
            lastInvestmentReceived: lastInvestmentReceived,
            pitchPdfUrl: pitchPdfUrl,
            state: state,
            country: country,
            employeeCount: employeeCount,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
