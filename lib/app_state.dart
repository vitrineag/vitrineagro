import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _startupSiteRedirect =
        prefs.getString('ff_startupSiteRedirect') ?? _startupSiteRedirect;
  }

  late SharedPreferences prefs;

  String _startupSiteRedirect = '';
  String get startupSiteRedirect => _startupSiteRedirect;
  set startupSiteRedirect(String _value) {
    _startupSiteRedirect = _value;
    prefs.setString('ff_startupSiteRedirect', _value);
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
