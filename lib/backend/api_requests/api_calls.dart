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
    );
  }
}
