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
    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Store Phone Number',
      apiUrl: 'https://helpfinder.online/generateOtp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
  static dynamic fulljson(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
        true,
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
        true,
      );
  static dynamic otp(dynamic response) => getJsonField(
        response,
        r'''$.otp''',
        true,
      );
}

class StoreUserDetailsCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? location = '',
    String? phonenumber = '',
    String? gender = '',
    String? businessname = '',
    String? description = '',
  }) {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "location": "${location}",
  "phonenumber": "${phonenumber}",
  "businessname": "${businessname}",
  "gender": "${gender}",
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Store User Details',
      apiUrl: 'https://helpfinder.online/registerUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic phonenumber(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic updaterecord(dynamic response) => getJsonField(
        response,
        r'''$.updatedRecord''',
      );
}

class FetchVideosCall {
  static Future<ApiCallResponse> call({
    String? user = '',
  }) {
    final ffApiRequestBody = '''
{
  "user": "${user}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Videos',
      apiUrl: 'https://honourcodes.com/clips',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
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

class FetchUsersCall {
  static Future<ApiCallResponse> call({
    String? user = '',
    int? page,
    String? q = '',
  }) {
    final ffApiRequestBody = '''
{
  "phone": "${user}",
  "page": ${page},
  "q": "${q}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Users',
      apiUrl: 'https://helpfinder.online/findusers',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.users''',
        true,
      );
  static dynamic usersId(dynamic response) => getJsonField(
        response,
        r'''$.users[:].id''',
        true,
      );
  static dynamic usersFullname(dynamic response) => getJsonField(
        response,
        r'''$.users[:].fullname''',
        true,
      );
  static dynamic usersemail(dynamic response) => getJsonField(
        response,
        r'''$.users[:].email''',
        true,
      );
  static dynamic usersphone1(dynamic response) => getJsonField(
        response,
        r'''$.users[:].phone1''',
        true,
      );
  static dynamic phone2(dynamic response) => getJsonField(
        response,
        r'''$.users[:].phone2''',
        true,
      );
  static dynamic shopno(dynamic response) => getJsonField(
        response,
        r'''$.users[:].shop_no''',
        true,
      );
  static dynamic street(dynamic response) => getJsonField(
        response,
        r'''$.users[:].street''',
        true,
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.users[:].city''',
        true,
      );
  static dynamic lga(dynamic response) => getJsonField(
        response,
        r'''$.users[:].lga''',
        true,
      );
  static dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.users[:].state''',
        true,
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.users[:].country''',
        true,
      );
  static dynamic businessname(dynamic response) => getJsonField(
        response,
        r'''$.users[:].businessname''',
        true,
      );
  static dynamic specialization(dynamic response) => getJsonField(
        response,
        r'''$.users[:].specialization''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.users[:].description''',
        true,
      );
  static dynamic totalpages(dynamic response) => getJsonField(
        response,
        r'''$.total_pages''',
      );
  static dynamic currentpage(dynamic response) => getJsonField(
        response,
        r'''$.current_page''',
      );
  static dynamic totalrecords(dynamic response) => getJsonField(
        response,
        r'''$.total_records''',
      );
  static dynamic passport(dynamic response) => getJsonField(
        response,
        r'''$.users[:].passport''',
        true,
      );
}

class UploadProfilePictureCall {
  static Future<ApiCallResponse> call({
    String? phonenumber = '',
    FFUploadedFile? profilePicture,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Upload Profile Picture',
      apiUrl: 'https://helpfinder.online/profilepicture',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'profilePicture': profilePicture,
        'phonenumber': phonenumber,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic profilepic(dynamic response) => getJsonField(
        response,
        r'''$.profilePicture''',
      );
}

class UpdateLocationCall {
  static Future<ApiCallResponse> call({
    String? phonenumber = '',
    String? location = '',
  }) {
    final ffApiRequestBody = '''
{
  "phonenumber": "${phonenumber}",
  "location": "${location}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Location',
      apiUrl: 'https://helpfinder.online/updateLocation',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$.lat''',
      );
  static dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$.lng''',
      );
}

class LoginUserCall {
  static Future<ApiCallResponse> call({
    String? phonenumber = '',
    String? password = '',
  }) {
    final ffApiRequestBody = '''
{
  "phonenumber": "${phonenumber}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login user',
      apiUrl: 'https://helpfinder.online/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic fullname(dynamic response) => getJsonField(
        response,
        r'''$.userRecord.fullname''',
      );
  static dynamic profilepic(dynamic response) => getJsonField(
        response,
        r'''$.userRecord.passport''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.userRecord.email''',
      );
  static dynamic firstname(dynamic response) => getJsonField(
        response,
        r'''$.userRecord.firstname''',
      );
  static dynamic lastname(dynamic response) => getJsonField(
        response,
        r'''$.userRecord.lastname''',
      );
  static dynamic userid(dynamic response) => getJsonField(
        response,
        r'''$.userRecord.id''',
      );
}

class FetchCountriesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Countries',
      apiUrl: 'https://helpfinder.online/countries',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$[:].country''',
        true,
      );
}

class CheckIfLocationIsSetCall {
  static Future<ApiCallResponse> call({
    String? phonenumber = '',
  }) {
    final ffApiRequestBody = '''
{
  "phonenumber": "${phonenumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Check if Location is set',
      apiUrl: 'https://helpfinder.online/isLocationSet',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
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
