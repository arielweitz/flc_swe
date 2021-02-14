// Imports the Flutter Driver API.
import 'package:test/test.dart';
import 'package:flc_swe/practice_math.dart';

void main() {
  group('Practice Math', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    // final counterTextFinder = find.byValueKey('counter');
    // final buttonFinder = find.byValueKey('increment');

    // FlutterDriver driver;
    PracticeMath obj = PracticeMath();

    // // Connect to the Flutter driver before running any tests.
    // setUpAll(() async {
    //   driver = await FlutterDriver.connect();
    // });

    // // Close the connection to the driver after the tests have completed.
    // tearDownAll(() async {
    //   if (driver != null) {
    //     driver.close();
    //   }
    // });

    // test('starts at 0', () async {
    //   // Use the `driver.getText` method to verify the counter starts at 0.
    //   expect(await driver.getText(counterTextFinder), "0");
    // });

    // test('increments the counter', () async {
    //   // First, tap the button.
    //   await driver.tap(buttonFinder);

    //   // Then, verify the counter text is incremented by 1.
    //   expect(await driver.getText(counterTextFinder), "1");
    // });

    test('sum', () {
      int res = obj.sum(2, 2);

      expect(res, 4);
    });

    test('sub', () {
      int res = obj.sub(2, 2);

      expect(res, 0);
    });

    test('mult', () {
      int res = obj.mult(4, 2);

      expect(res, 8);
    });
  });
}
