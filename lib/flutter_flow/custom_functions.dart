import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

UserFavoritiesStartupsRecord getFirstFavoritiesStartups(
    List<UserFavoritiesStartupsRecord> favoriteStartupUsers) {
  return favoriteStartupUsers.first;
}

String replaceCommaToSpace(String text) {
  return text.replaceAll(',', ' ');
}

List<String> splitByChar(
  String value,
  String splitChar,
) {
  return value.split(splitChar);
}

String getCategory(StartupsRecord startup) {
  return splitByChar(startup.category ?? '', ';').first;
}

List<String> getSectorsOfActivity(StartupsRecord startup) {
  return splitByChar(startup!.sectorsOfActivity!, ', \n');
}

String encodeUri(String uri) {
  // encode string uri
  final encodedUri = Uri.encodeComponent(uri);
  return encodedUri;
}

StartupTrackingRecord getFirstStartupTracking(
    List<StartupTrackingRecord> startupTrackings) {
  return startupTrackings.first;
}

String removeAllLineBreaks(String text) {
  // remove all line breaks
  return text.replaceAll('\n', ' ');
}
