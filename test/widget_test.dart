import 'package:equal_containers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify Containers have equal heights',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var flexibleWidgets = find.byType(Flexible);
    expect(flexibleWidgets, findsWidgets);
    print('Flexible Widgets found successfully.');

    // Find the three Flexible containers
    final flexibleContainers =
        tester.widgetList<Flexible>(find.byType(Flexible)).toList();
    expect(flexibleContainers.length, 3);
    print('Found 3 containers.');

    for (final flexibleContainer in flexibleContainers) {
      // check for all flexibleContainers to have flex: 1
      expect(flexibleContainer.flex, 1);

      final container = flexibleContainer.child as Container;
      expect(
          [Colors.red, Colors.blue, Colors.yellow], contains(container.color));
      if (container.color == Colors.red) {
        print('Red container found.');
      } else if (container.color == Colors.yellow) {
        print('Yellow container found.');
      } else if (container.color == Colors.blue) {
        print('Blue container found.');
      }

      // check for child of flexibleContainer with type Container
      expect(flexibleContainer.child, isA<Container>());
    }
    print('All containers have equal heights.');
  });
}
