// Imports the Flutter Driver API.
import 'package:flc_swe/models/profile.dart';
import 'package:test/test.dart';
import 'package:flc_swe/practice_math.dart';

void main() {
  group('Practice Math', () {
    //flutter version was having some issues with widget tests so those have been ommited

    //trivial tests
    PracticeMath obj = PracticeMath();

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

    test('sum', () {
      int res = obj.sum(2, 2);

      expect(res, 4);
    });
  });

  group('Objects', () {
    //some tests related to object creation and making sure everything works

    Profile temp = Profile(
        bio: "hello",
        name: "bob",
        uid: "bob123",
        email: "bob123@ufl.edu",
        linkedin: "bob/linkedin",
        phone: "1234567890",
        major: "cs",
        years: "2020-2021",
        imageURL: "123.com",
        position: "Councilmember",
        standing: "Freshman",
        committees: "1, 2, 3",
        lookingFor: ["Internship"]);

    test('bio', () {
      String res = temp.bio;

      expect(res, "hello");
    });

    test('name', () {
      String res = temp.name;

      expect(res, "bob");
    });

    test('uid', () {
      String res = temp.uid;

      expect(res, "bob123");
    });

    test('email', () {
      String res = temp.email;

      expect(res, "bob123@ufl.edu");
    });

    test('linkedin', () {
      String res = temp.linkedin;

      expect(res, "bob/linkedin");
    });

    test('phone', () {
      String res = temp.phone;

      expect(res, "1234567890");
    });

    test('major', () {
      String res = temp.major;

      expect(res, "cs");
    });

    test('years', () {
      String res = temp.years;

      expect(res, "2020-2021");
    });

    test('imageURL', () {
      String res = temp.imageURL;

      expect(res, "123.com");
    });

    test('position', () {
      String res = temp.position;

      expect(res, "Councilmember");
    });

    test('standing', () {
      String res = temp.standing;

      expect(res, "Freshman");
    });

    test('committees', () {
      String res = temp.committees;

      expect(res, "1, 2, 3");
    });

    test('lookingFor', () {
      dynamic res = temp.lookingFor;

      List<String> obj = [];

      expect(res.runtimeType, obj.runtimeType);
    });
  });

  // group('Firebase', () {
  //   //some tests related to firebase, they are commented out though as they have hard coded information

  //   test('bio', () {
  //     String res = temp.bio;

  //     expect(res, "hello");
  //   });

  // });
}
