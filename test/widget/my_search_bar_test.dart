import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_interview_prep/home_page.dart';

void main() {
  testWidgets("debounce searchbar test", (tester) async {
    const displayTextKey = Key("searchbar-text-display");
    const inputFieldKey = Key("searchbar-text-field");
    const textInput = "Hello";

    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    expect(find.byKey(displayTextKey), findsOneWidget);
    expect(find.byKey(inputFieldKey), findsOneWidget);

    await tester.enterText(find.byKey(inputFieldKey), textInput);
    await tester.pump();
    expect(find.text(textInput), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    expect(find.text(textInput), findsNWidgets(2));
  });
}
