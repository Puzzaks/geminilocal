import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Google Play resource points at the current application id', () {
    final raw = File('assets/additional_resources.json').readAsStringSync();
    final resources = (jsonDecode(raw) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    final playStoreResource = resources.singleWhere(
      (resource) => resource['name'] == "Application's Google Store page",
    );

    expect(
      playStoreResource['value'],
      'https://play.google.com/store/apps/details?id=page.puzzak.paios',
    );
  });
}
