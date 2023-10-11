import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _userid = prefs.getString('ff_userid') ?? _userid;
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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<double> _xAxis = [1, 2, 3, 4, 5, 6, 7];
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

  List<double> _yAxis = [2, 3, 6, 4, 5, 3, 4];
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

  String _userid = '';
  String get userid => _userid;
  set userid(String _value) {
    _userid = _value;
    prefs.setString('ff_userid', _value);
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

  final _searchqueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> searchquery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _searchqueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSearchqueryCache() => _searchqueryManager.clear();
  void clearSearchqueryCacheKey(String? uniqueKey) =>
      _searchqueryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
