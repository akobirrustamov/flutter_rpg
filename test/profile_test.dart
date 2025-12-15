import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/model/vocation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';

void main() {
  testWidgets('Profile screen stats interaction test', (WidgetTester tester) async {
    // Create a dummy character
    final character = Character(
      id: "1",
      name: "Test Char",
      vocation: Vocation.wizard,
      slogan: "Test Slogan"
    );

    // Build the Profile widget
    await tester.pumpWidget(MaterialApp(
      home: Profile(character: character),
    ));

    // Verify initial state
    // Health is 10 initially defined in Stats mixin
    expect(find.text('10'), findsNWidgets(5)); // 4 stats + points = 5 times '10' initially? 
    // Wait, points=10, health=10, attack=10, defense=10, skill=10. All are 10.
    // So finding '10' might be ambiguous.
    
    // Let's look for "Available Points: " followed by 10.
    // The code structure is: Text("Available Points: "), StyledHeading(points.toString())
    // They are siblings in a Row.
    
    // Let's verify character state directly or try to target specific widgets.
    // But widget tests verify UI.
    
    // Let's try to tap the increase button for the FIRST stat (Health).
    // The buildStatRow order is: Health, Attack, Defense, Skill.
    // So the first add_circle_outline icon should be for Health.
    
    final addButtons = find.byIcon(Icons.add_circle_outline);
    expect(addButtons, findsNWidgets(4));

    final removeButtons = find.byIcon(Icons.remove_circle_outline);
    expect(removeButtons, findsNWidgets(4));

    // Tap to increase Health (index 0)
    await tester.tap(addButtons.at(0));
    await tester.pump();

    // Verify model updated (Profile updates the passed character object)
    expect(character.statsAsMap['health'], 11);
    expect(character.points, 9);
    
    // Tap to decrease Health (index 0)
    await tester.tap(removeButtons.at(0));
    await tester.pump();
    
    expect(character.statsAsMap['health'], 10);
    expect(character.points, 10);

  });

  testWidgets('Profile screen skill interaction test', (WidgetTester tester) async {
    final character = Character(
      id: "1",
      name: "Test Char",
      vocation: Vocation.wizard,
      slogan: "Test Slogan"
    );

    await tester.pumpWidget(MaterialApp(
      home: Profile(character: character),
    ));

    // Verify initial skill is empty (or check text "No Skill" / "Select a skill")
    expect(find.text('No Skill'), findsOneWidget);

    // Open skill selection
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle(); // Wait for bottom sheet

    // Should see wizard skills. 
    // From skill.dart, wizard skills are 'Brute Force Bolt', etc.
    expect(find.text('Brute Force Bolt'), findsOneWidget);
    
    // Tap a skill
    await tester.tap(find.text('Brute Force Bolt'));
    await tester.pumpAndSettle(); // Wait for bottom sheet to close

    // Verify skill updated
    expect(character.skills.first.name, 'Brute Force Bolt');
    expect(find.text('Brute Force Bolt'), findsOneWidget);
  });
}
