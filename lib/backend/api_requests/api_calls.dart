import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TestApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TEST API',
      apiUrl: 'https://helpfinder.online/api',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyMobileCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    int? accounttype,
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "${phone}",
  "account_type": ${accounttype}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Mobile',
      apiUrl: 'https://helpfinder.online/api/sendotp/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? otp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.otp''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone''',
      ));
  static int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status_code''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? accounttype(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.account_type''',
      ));
  static int? clientid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.client_id''',
      ));
  static dynamic errormsg(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class UpdateDetailsCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? password = '',
    String? accounttype = '',
    String? businessname = '',
    String? businessdescription = '',
    String? specialization = '',
    String? birthdate = '',
    String? gender = '',
    String? maritalstatus = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "firstname": "${firstname}",
  "lastname": "${lastname}",
  "email": "${email}",
  "password": "${password}",
  "accounttype": "${accounttype}",
  "businessname": "${businessname}",
  "description": "${businessdescription}",
  "specialization": "${specialization}",
  "birthdate": "${birthdate}",
  "gender": "${gender}",
  "maritalstatus": "${maritalstatus}",
"specialization" : "${specialization}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Details',
      apiUrl: 'https://helpfinder.online/api/updatedetails/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.fullname''',
      ));
  static dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.email''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.phone1''',
      ));
  static String? errormsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class SetLocationCall {
  static Future<ApiCallResponse> call({
    int? userid,
    String? accounttype = '',
    String? city = '',
    String? lga = '',
    String? state = '',
    String? country = '',
    String? shopNo = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${userid},
  "accounttype": ${accounttype},
  "city": ${city},
  "lga": ${lga},
  "state": ${state},
  "country": ${country},
  "shop_no": "${shopNo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Set location',
      apiUrl: 'https://helpfinder.online/api/setlocation/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class FetchCountriesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'fetch countries',
      apiUrl: 'https://helpfinder.online/api/countries/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? countryId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? countryName(dynamic response) => getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?;
}

class FetchStatesCall {
  static Future<ApiCallResponse> call({
    String? countryid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch States',
      apiUrl: 'https://helpfinder.online/api/state/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'countryid': countryid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? stateid(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? countryid(dynamic response) => getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?;
  static List? statename(dynamic response) => getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?;
}

class FetchLgaCall {
  static Future<ApiCallResponse> call({
    String? countryid = '',
    String? stateid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Lga',
      apiUrl: 'https://helpfinder.online/api/lga/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'countryid': countryid,
        'stateid': stateid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? lgaid(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? countryid(dynamic response) => getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?;
  static List? stateid(dynamic response) => getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?;
  static List? lgaName(dynamic response) => getJsonField(
        response,
        r'''$[:].lga''',
        true,
      ) as List?;
}

class FetchCityCall {
  static Future<ApiCallResponse> call({
    String? countryid = '',
    String? stateid = '',
    String? lgaid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch City',
      apiUrl: 'https://helpfinder.online/api/city/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'countryid': countryid,
        'stateid': stateid,
        'lgaid': lgaid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? cityId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? countryId(dynamic response) => getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?;
  static List? stateId(dynamic response) => getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?;
  static List? lgaId(dynamic response) => getJsonField(
        response,
        r'''$[:].lga''',
        true,
      ) as List?;
  static List? cityName(dynamic response) => getJsonField(
        response,
        r'''$[:].city''',
        true,
      ) as List?;
}

class AddProfilePictureCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accounttype,
    FFUploadedFile? profilePicture,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add profile Picture',
      apiUrl: 'https://helpfinder.online/api/addprofilepicture/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': id,
        'accounttype': accounttype,
        'profilePicture': profilePicture,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginUserCall {
  static Future<ApiCallResponse> call({
    String? phonenumber = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phonenumber": "${phonenumber}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login User',
      apiUrl: 'https://helpfinder.online/api/login/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? tableName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.table''',
      ));
  static int? accountType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.accounttype''',
      ));
  static dynamic? user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  static int? userid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.fullname''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.phone1''',
      ));
  static String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstname''',
      ));
  static String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lastname''',
      ));
  static String? profilepic(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.passport''',
      ));
  static int? app(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.app''',
      ));
}

class GetBalanceCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accountType,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "account_type": ${accountType}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Balance',
      apiUrl: 'https://helpfinder.online/api/getbalance/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? userid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static int? accounttype(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.account_type''',
      ));
  static String? balance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.balance''',
      ));
}

class FIndNearbyUsersCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accountType,
  }) async {
    final ffApiRequestBody = '''
{
    "id" : ${id},
    "account_type" : ${accountType}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FInd Nearby Users',
      apiUrl: 'https://helpfinder.online/api/fetchnearbyusers/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? userid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static int? accounttype(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.account_type''',
      ));
  static String? lgaid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lga''',
      ));
  static String? countryid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.country''',
      ));
  static String? stateid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.state''',
      ));
  static List? nearbyusers(dynamic response) => getJsonField(
        response,
        r'''$.nearby_users''',
        true,
      ) as List?;
}

class SearchSpecializationsCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accountType,
    String? q = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "account_type": ${accountType},
  "q": "${q}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SEARCH SPECIALIZATIONS',
      apiUrl: 'https://helpfinder.online/api/fetchspecializations/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? specializations(dynamic response) => getJsonField(
        response,
        r'''$.specializations''',
        true,
      ) as List?;
  static List<String>? count(dynamic response) => (getJsonField(
        response,
        r'''$.specializations[:].client_count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FetchAllSpecializationCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accountType,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "account_type": ${accountType}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch All Specialization',
      apiUrl: 'https://helpfinder.online/api/fetchspecializations/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? specializations(dynamic response) => getJsonField(
        response,
        r'''$.specializations''',
        true,
      ) as List?;
  static List? specializationclients(dynamic response) => getJsonField(
        response,
        r'''$.specializations[:].clients''',
        true,
      ) as List?;
  static dynamic totalclients(dynamic response) => getJsonField(
        response,
        r'''$.total_clients''',
      );
}

class AddMediaCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    FFUploadedFile? media,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Media',
      apiUrl: 'https://helpfinder.online/api/addimage/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'media': media,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchImagesCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Images',
      apiUrl: 'https://helpfinder.online/api/fetchimages/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? mediarecords(dynamic response) => getJsonField(
        response,
        r'''$.media_records''',
        true,
      ) as List?;
  static dynamic mediarecordspath(dynamic response) => getJsonField(
        response,
        r'''$.media_records[:].path''',
      );
  static List? path(dynamic response) => getJsonField(
        response,
        r'''$.media_records[:].image''',
        true,
      ) as List?;
  static List? userid(dynamic response) => getJsonField(
        response,
        r'''$.media_records[:].userid''',
        true,
      ) as List?;
  static List? id(dynamic response) => getJsonField(
        response,
        r'''$.media_records[:].id''',
        true,
      ) as List?;
  static List? uploaddate(dynamic response) => getJsonField(
        response,
        r'''$.media_records[:].upload_date''',
        true,
      ) as List?;
}

class DeleteImageCall {
  static Future<ApiCallResponse> call({
    String? mediaId = '',
  }) async {
    final ffApiRequestBody = '''
{
"media_id" : ${mediaId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Image',
      apiUrl: 'https://helpfinder.online/api/deleteimage/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? add(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class FetchPostsCall {
  static Future<ApiCallResponse> call({
    int? userId,
    int? accountType,
    int? page,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${userId},
  "account_type": ${accountType},
  "page": ${page}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Posts',
      apiUrl: 'https://helpfinder.online/api/fetchpost/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? nearbyUsers(dynamic response) => getJsonField(
        response,
        r'''$.nearby_users''',
        true,
      ) as List?;
  static int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_pages''',
      ));
  static int? currentpage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current_page''',
      ));
  static List? media(dynamic response) => getJsonField(
        response,
        r'''$.nearby_users[:].media''',
        true,
      ) as List?;
}

class FetchmessagesCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accountType,
  }) async {
    final ffApiRequestBody = '''
{
    "id" :${id},
    "account_type" : ${accountType}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchmessages',
      apiUrl: 'https://helpfinder.online/api/fetchmessages/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  static List? conversations(dynamic response) => getJsonField(
        response,
        r'''$.conversations''',
        true,
      ) as List?;
  static int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? userdetails(dynamic response) => getJsonField(
        response,
        r'''$.conversations[:].user_details''',
        true,
      ) as List?;
}

class ViewMessagesCall {
  static Future<ApiCallResponse> call({
    int? senderId,
    int? receiverId,
    int? senderAccountType,
    int? receiverAccountType,
  }) async {
    final ffApiRequestBody = '''
{
    "sender_id": ${senderId},
    "receiver_id": ${receiverId},
    "sender_account_type": ${senderAccountType},
    "receiver_account_type": ${receiverAccountType}
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'View messages',
      apiUrl: 'https://helpfinder.online/api/viewmessages/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? messages(dynamic response) => getJsonField(
        response,
        r'''$.messages''',
        true,
      ) as List?;
}

class SendMessagesCall {
  static Future<ApiCallResponse> call({
    String? receiverId = '',
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "${receiverId}",
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send messages',
      apiUrl: 'https://helpfinder.online/api/sendmessages/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VerifyUserCall {
  static Future<ApiCallResponse> call({
    int? id,
    int? accounttype,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": ${id},
  "accountType": ${accounttype}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify User',
      apiUrl: 'https://helpfinder.online/api/verify/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete User',
      apiUrl: 'https://helpfinder.online/api/deleteuser.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'phone': phone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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
}

class ResendOTPCall {
  static Future<ApiCallResponse> call({
    int? accountType,
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "account_type": ${accountType},
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Resend OTP',
      apiUrl: 'https://helpfinder.online/api/resendotp/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic otp(dynamic response) => getJsonField(
        response,
        r'''$.otp''',
      );
}

class FetchCategoryCall {
  static Future<ApiCallResponse> call({
    String? specialization = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Category',
      apiUrl: 'https://helpfinder.online/api/fetchspecializations/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'specialization': specialization,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? clients(dynamic response) => getJsonField(
        response,
        r'''$.clients''',
        true,
      ) as List?;
  static List<String>? clientsid(dynamic response) => (getJsonField(
        response,
        r'''$.clients[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FetchUserCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch user',
      apiUrl: 'https://helpfinder.online/api/fetchuser/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  static String? businessname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].businessname''',
      ));
  static String? desc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].description''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].passport''',
      ));
  static String? lga(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].lga''',
      ));
  static String? shopno(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].shop_no''',
      ));
  static String? phone1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].phone1''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].state''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].country''',
      ));
  static String? specialization(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].specialization''',
      ));
  static String? mainemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].mainemail''',
      ));
  static String? mainphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].mainphone''',
      ));
  static String? app(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].app''',
      ));
}

class UpdateBusinessProfileCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? businessname = '',
    String? businessdescription = '',
    String? specialization = '',
  }) async {
    final ffApiRequestBody = '''
{
"id" : ${id},
"businessname" : "${businessname}",
"description" : "${businessdescription}",
"specialization" : "${specialization}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Business Profile',
      apiUrl: 'https://helpfinder.online/api/updateprofile/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ChangepasswordCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? password = '',
    String? confirmpassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "password": "${password}",
  "confirmpassword": "${confirmpassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changepassword',
      apiUrl: 'https://helpfinder.online/api/changepassword/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
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
