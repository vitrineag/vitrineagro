import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

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
