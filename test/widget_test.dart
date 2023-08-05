
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_widget_test/modul/post.dart';
import 'package:unit_widget_test/pages/detail_page.dart';


void main() {
  testWidgets('PostDetailPage displays post details', (WidgetTester tester) async {
    // Create a mock Post object for testing
    final mockPost = Post(
      id: 1,
      title: 'Test Post Title',
      body: 'This is a test post body.',
      // Add any other properties needed for your Post class
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: PostDetailPage(id: mockPost.id!),
      ),
    );

    // Verify that the app starts with a CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the API call to complete (replace with your actual loading time)
    await tester.pumpAndSettle(Duration(seconds: 1));

    // Verify that the CircularProgressIndicator is no longer visible
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verify that the post details are displayed correctly
    expect(find.text(mockPost.title!), findsOneWidget);
    expect(find.text(mockPost.body!), findsOneWidget);
  });
}
