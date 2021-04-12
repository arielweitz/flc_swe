import 'package:meta/meta.dart';

@immutable
class UserModel {
  final String uid;
  final String email;
  final String photoURL;
  final String displayName;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  const UserModel(
      {this.uid,
      @required this.email,
      this.photoURL,
      this.displayName,
      this.firstName,
      this.lastName,
      this.phoneNumber});
}
