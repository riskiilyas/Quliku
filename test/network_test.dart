import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quliku/model/response/Reccomend_mandor_response.dart';

import '../lib/util/network.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Network Tests', () {
    late Network network;

    setUp(() {
      network = Network();
    });

    test(
        'getReccomendedMandor should return a valid ReccomendMandorResponse object',
        () async {
      // Load the JSON file content
      final jsonContent =
          await rootBundle.loadString('assets/json/list_mandor.json');
      final jsonData = json.decode(jsonContent);
      final ReccomendMandorResponse mockResponse =
          ReccomendMandorResponse.fromJson(jsonData);

      // Call the getReccomendedMandor() method
      final response = await network.getReccomendedMandor();

      // Assert that the response is not null and of type ReccomendMandorResponse
      expect(response, isNotNull);
      expect(response, equals(mockResponse));
    });
  });
}
