import 'package:flutter_test/flutter_test.dart';

import 'package:assignment_2/main.dart';

void main() {
  testWidgets('Splash screen shows, then Home screen opens',
          (WidgetTester tester) async {
        await tester.pumpWidget(const ExplorePakistanApp());

        // Splash screen is visible first.
        expect(find.text('Explore Pakistan'), findsOneWidget);
        expect(find.text('Discover. Travel. Remember.'), findsOneWidget);

        // Wait past the 3-second timer and the page transition.
        await tester.pump(const Duration(seconds: 3));
        await tester.pump(const Duration(seconds: 1));

        // Home screen is now shown.
        expect(find.text('Discover the beauty of Pakistan'), findsOneWidget);
      });
}