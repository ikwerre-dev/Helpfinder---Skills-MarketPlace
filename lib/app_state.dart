import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

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
      _clips = prefs.getStringList('ff_clips')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _clips;
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

  String _otp = '';
  String get otp => _otp;
  set otp(String _value) {
    _otp = _value;
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String _value) {
    _phonenumber = _value;
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

  List<dynamic> _clips = [];
  List<dynamic> get clips => _clips;
  set clips(List<dynamic> _value) {
    _clips = _value;
    prefs.setStringList('ff_clips', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToClips(dynamic _value) {
    _clips.add(_value);
    prefs.setStringList('ff_clips', _clips.map((x) => jsonEncode(x)).toList());
  }

  void removeFromClips(dynamic _value) {
    _clips.remove(_value);
    prefs.setStringList('ff_clips', _clips.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromClips(int _index) {
    _clips.removeAt(_index);
    prefs.setStringList('ff_clips', _clips.map((x) => jsonEncode(x)).toList());
  }

  void updateClipsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _clips[_index] = updateFn(_clips[_index]);
    prefs.setStringList('ff_clips', _clips.map((x) => jsonEncode(x)).toList());
  }
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
