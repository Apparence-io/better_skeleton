import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_skeleton/better_skeleton.dart';

void main() {
  const MethodChannel channel = MethodChannel('better_skeleton');

  TestWidgetsFlutterBinding.ensureInitialized();

  group('one skeleton widget', () {
    testWidgets('create and animating', (WidgetTester tester) async {});
  });
}
