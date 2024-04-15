import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_chatgpt3/main.dart';

void main() {
  testWidgets('AppBar title is correct', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Verify the presence and correctness of the title in the AppBar
    expect(find.text('Product Listing'), findsOneWidget);
  });
}
