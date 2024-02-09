import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _xAxis =
          prefs.getStringList('ff_xAxis')?.map(double.parse).toList() ?? _xAxis;
    });
    _safeInit(() {
      _yAxis =
          prefs.getStringList('ff_yAxis')?.map(double.parse).toList() ?? _yAxis;
    });
    _safeInit(() {
      _firstname = prefs.getString('ff_firstname') ?? _firstname;
    });
    _safeInit(() {
      _lastname = prefs.getString('ff_lastname') ?? _lastname;
    });
    _safeInit(() {
      _clipsurl = prefs.getStringList('ff_clipsurl') ?? _clipsurl;
    });
    _safeInit(() {
      _profilepicture = prefs.getString('ff_profilepicture') ?? _profilepicture;
    });
    _safeInit(() {
      _phonenumber = prefs.getString('ff_phonenumber') ?? _phonenumber;
    });
    _safeInit(() {
      _fingerprint = prefs.getString('ff_fingerprint') ?? _fingerprint;
    });
    _safeInit(() {
      _fingerprintPassword =
          prefs.getString('ff_fingerprintPassword') ?? _fingerprintPassword;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_myJson')) {
        try {
          _myJson = jsonDecode(prefs.getString('ff_myJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _description = prefs.getString('ff_description') ?? _description;
    });
    _safeInit(() {
      _accounttype = prefs.getInt('ff_accounttype') ?? _accounttype;
    });
    _safeInit(() {
      _userid = prefs.getInt('ff_userid') ?? _userid;
    });
    _safeInit(() {
      _showbalance = prefs.getInt('ff_showbalance') ?? _showbalance;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_searchJson')) {
        try {
          _searchJson = jsonDecode(prefs.getString('ff_searchJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_nearbyusers')) {
        try {
          _nearbyusers = jsonDecode(prefs.getString('ff_nearbyusers') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<double> _xAxis = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0];
  List<double> get xAxis => _xAxis;
  set xAxis(List<double> _value) {
    _xAxis = _value;
    prefs.setStringList('ff_xAxis', _value.map((x) => x.toString()).toList());
  }

  void addToXAxis(double _value) {
    _xAxis.add(_value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeFromXAxis(double _value) {
    _xAxis.remove(_value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromXAxis(int _index) {
    _xAxis.removeAt(_index);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void updateXAxisAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _xAxis[_index] = updateFn(_xAxis[_index]);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInXAxis(int _index, double _value) {
    _xAxis.insert(_index, _value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  List<double> _yAxis = [2.0, 3.0, 6.0, 4.0, 5.0, 3.0, 4.0];
  List<double> get yAxis => _yAxis;
  set yAxis(List<double> _value) {
    _yAxis = _value;
    prefs.setStringList('ff_yAxis', _value.map((x) => x.toString()).toList());
  }

  void addToYAxis(double _value) {
    _yAxis.add(_value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeFromYAxis(double _value) {
    _yAxis.remove(_value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromYAxis(int _index) {
    _yAxis.removeAt(_index);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void updateYAxisAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _yAxis[_index] = updateFn(_yAxis[_index]);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInYAxis(int _index, double _value) {
    _yAxis.insert(_index, _value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  String _otp = '';
  String get otp => _otp;
  set otp(String _value) {
    _otp = _value;
  }

  String _firstname = '';
  String get firstname => _firstname;
  set firstname(String _value) {
    _firstname = _value;
    prefs.setString('ff_firstname', _value);
  }

  String _lastname = '';
  String get lastname => _lastname;
  set lastname(String _value) {
    _lastname = _value;
    prefs.setString('ff_lastname', _value);
  }

  List<String> _clipsurl = [];
  List<String> get clipsurl => _clipsurl;
  set clipsurl(List<String> _value) {
    _clipsurl = _value;
    prefs.setStringList('ff_clipsurl', _value);
  }

  void addToClipsurl(String _value) {
    _clipsurl.add(_value);
    prefs.setStringList('ff_clipsurl', _clipsurl);
  }

  void removeFromClipsurl(String _value) {
    _clipsurl.remove(_value);
    prefs.setStringList('ff_clipsurl', _clipsurl);
  }

  void removeAtIndexFromClipsurl(int _index) {
    _clipsurl.removeAt(_index);
    prefs.setStringList('ff_clipsurl', _clipsurl);
  }

  void updateClipsurlAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _clipsurl[_index] = updateFn(_clipsurl[_index]);
    prefs.setStringList('ff_clipsurl', _clipsurl);
  }

  void insertAtIndexInClipsurl(int _index, String _value) {
    _clipsurl.insert(_index, _value);
    prefs.setStringList('ff_clipsurl', _clipsurl);
  }

  String _profilepicture = '';
  String get profilepicture => _profilepicture;
  set profilepicture(String _value) {
    _profilepicture = _value;
    prefs.setString('ff_profilepicture', _value);
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String _value) {
    _phonenumber = _value;
    prefs.setString('ff_phonenumber', _value);
  }

  String _fingerprint = '';
  String get fingerprint => _fingerprint;
  set fingerprint(String _value) {
    _fingerprint = _value;
    prefs.setString('ff_fingerprint', _value);
  }

  String _fingerprintPassword = '';
  String get fingerprintPassword => _fingerprintPassword;
  set fingerprintPassword(String _value) {
    _fingerprintPassword = _value;
    prefs.setString('ff_fingerprintPassword', _value);
  }

  String _search = '';
  String get search => _search;
  set search(String _value) {
    _search = _value;
  }

  dynamic _myJson;
  dynamic get myJson => _myJson;
  set myJson(dynamic _value) {
    _myJson = _value;
    prefs.setString('ff_myJson', jsonEncode(_value));
  }

  String _description = '';
  String get description => _description;
  set description(String _value) {
    _description = _value;
    prefs.setString('ff_description', _value);
  }

  int _accounttype = 0;
  int get accounttype => _accounttype;
  set accounttype(int _value) {
    _accounttype = _value;
    prefs.setInt('ff_accounttype', _value);
  }

  int _userid = 0;
  int get userid => _userid;
  set userid(int _value) {
    _userid = _value;
    prefs.setInt('ff_userid', _value);
  }

  int _showbalance = 0;
  int get showbalance => _showbalance;
  set showbalance(int _value) {
    _showbalance = _value;
    prefs.setInt('ff_showbalance', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  dynamic _searchJson;
  dynamic get searchJson => _searchJson;
  set searchJson(dynamic _value) {
    _searchJson = _value;
    prefs.setString('ff_searchJson', jsonEncode(_value));
  }

  dynamic _nearbyusers;
  dynamic get nearbyusers => _nearbyusers;
  set nearbyusers(dynamic _value) {
    _nearbyusers = _value;
    prefs.setString('ff_nearbyusers', jsonEncode(_value));
  }

  final _categoryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> category({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _categoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryCache() => _categoryManager.clear();
  void clearCategoryCacheKey(String? uniqueKey) =>
      _categoryManager.clearRequest(uniqueKey);

  final _catsearchManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> catsearch({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _catsearchManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCatsearchCache() => _catsearchManager.clear();
  void clearCatsearchCacheKey(String? uniqueKey) =>
      _catsearchManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
