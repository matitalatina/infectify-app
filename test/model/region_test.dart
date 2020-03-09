import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:infectify/model/region.dart';

void main() {
  group('Region Model', () {
    test('should deserialize from JSON', () {
      final region = Region.fromJson(jsonDecode('''
       {
          "date": "2020-03-08T17:00:00.000Z",
          "state": "ITA",
          "code": 5,
          "name": "Veneto",
          "hospitalizedWithSymptomsCount": 146,
          "intensiveCareCount": 47,
          "hospitalizedCount": 193,
          "quarantineAtHomeCount": 430,
          "positiveCount": 623,
          "newPositiveCount": 118,
          "healedCount": 29,
          "deathCount": 18,
          "caseCount": 670,
          "testCount": 15918,
          "location": {
            "coordinates": [
              12.33845213,
              45.43490485
            ],
            "type": "Point"
          }
        }
      '''));


        expect(region.date, DateTime.parse("2020-03-08T17:00:00.000Z"));
        expect(region.state, 'ITA');
        expect(region.code, 5);
        expect(region.name, 'Veneto');
        expect(region.hospitalizedWithSymptomsCount, 146);
        expect(region.intensiveCareCount, 47);
        expect(region.hospitalizedCount, 193);
        expect(region.quarantineAtHomeCount, 430);
        expect(region.positiveCount, 623);
        expect(region.newPositiveCount, 118);
        expect(region.healedCount, 29);
        expect(region.deathCount, 18);
        expect(region.caseCount, 670);
        expect(region.testCount, 15918);
        expect(region.location, LatLon(45.43490485, 12.33845213));
    });
  });
}