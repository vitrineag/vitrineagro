import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CallFeedNewsCall {
  static Future<ApiCallResponse> call({
    String? url = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CallFeedNews',
      apiUrl: 'https://api.urlmeta.org',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic YWRtaW5Adml0cmluZS5hZzpPb2RrczRTNTNCNmc0akhlbjRUSg==',
      },
      params: {
        'url': url,
      },
      returnBody: true,
      cache: false,
    );
  }
}

class GetLinkedinJwtCall {
  static Future<ApiCallResponse> call({
    String? redirectUri =
        'https://vitrine-agro-mfma7u.flutterflow.app/linkedinSign',
    String? authCode = '',
  }) {
    final body = '''
{
  "authCode": "${authCode}",
  "redirectUri": "${redirectUri}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetLinkedinJwt',
      apiUrl:
          'https://us-central1-food-io-221d5.cloudfunctions.net/getLinkedinProfileByAuthToken',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
