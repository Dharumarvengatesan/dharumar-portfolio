import 'package:flutter_test/flutter_test.dart';
import 'package:dharumar_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DharumarPortfolio());
    expect(find.text('Dharumar V.'), findsWidgets);
  });
}
