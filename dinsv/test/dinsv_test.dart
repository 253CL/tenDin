import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dinsv/dinsv.dart';

void main() {
  const MethodChannel channel = MethodChannel('dinsv');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Dinsv.platformVersion, '42');
  });
}