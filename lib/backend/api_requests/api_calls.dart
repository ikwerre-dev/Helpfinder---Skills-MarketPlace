import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StorePhoneNumberCall {
  static Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) {
    final body = '''
{
  "phoneNumber": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Store Phone Number',
      apiUrl: 'https://honourcodes.com/registerNumber',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic otp(dynamic response) => getJsonField(
        response,
        r'''$.otp''',
      );
  static dynamic fulljson(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class StoreUserDetailsCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? location = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "location": "${location}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Store User Details',
      apiUrl: 'https://honourcodes.com/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic full(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic userid(dynamic response) => getJsonField(
        response,
        r'''$.userId''',
      );
}

class FetchVideosCall {
  static Future<ApiCallResponse> call({
    String? user = '',
  }) {
    final body = '''
{
  "user": "${user}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Videos',
      apiUrl: 'https://honourcodes.com/clips',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic videos(dynamic response) => getJsonField(
        response,
        r'''$.videos''',
        true,
      );
  static dynamic videoId(dynamic response) => getJsonField(
        response,
        r'''$.videos[:].id''',
        true,
      );
  static dynamic videoUrl(dynamic response) => getJsonField(
        response,
        r'''$.videos[:].url''',
        true,
      );
  static dynamic videoLikes(dynamic response) => getJsonField(
        response,
        r'''$.videos[:].likes''',
        true,
      );
  static dynamic videoComments(dynamic response) => getJsonField(
        response,
        r'''$.videos[:].comments''',
        true,
      );
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
