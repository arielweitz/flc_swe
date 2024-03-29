import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';

enum InputType { Email, UFLEmail, Password, Text, Phone, Multiline, Year }

class InputField extends StatefulWidget {
  final String text;
  final InputType type;
  final TextEditingController controller;

  InputField(
      {@required this.text, @required this.controller, @required this.type});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _valid = true;
  List<String> vowels = ['a', 'e', 'i', 'o'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Style.theme.primaryColor),
              borderRadius: BorderRadius.circular(32.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Style.theme.primaryColor),
              borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Style.theme.primaryColor),
              borderRadius: BorderRadius.circular(32.0)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3, color: Theme.of(context).errorColor),
              borderRadius: BorderRadius.circular(32.0)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          labelText: widget.text,
          labelStyle: _valid
              ? Theme.of(context).textTheme.subtitle1
              : Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Theme.of(context).errorColor),
        ),
        style: Theme.of(context).textTheme.subtitle1.copyWith(height: 1.5),
        obscureText: widget.type == InputType.Password ? true : false,
        keyboardType:
            widget.type == InputType.Email || widget.type == InputType.UFLEmail
                ? TextInputType.emailAddress
                : widget.type == InputType.Phone
                    ? TextInputType.phone
                    : widget.type == InputType.Multiline
                        ? TextInputType.multiline
                        : widget.type == InputType.Year
                            ? TextInputType.number
                            : TextInputType.text,
        cursorColor: Style.theme.primaryColor,
        cursorWidth: 2.0,
        minLines: widget.type == InputType.Multiline ? 5 : 1,
        maxLines: widget.type == InputType.Multiline ? null : 1,
        showCursor: true,
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              _valid = false;
            });
            return !vowels.contains(widget.text.toLowerCase()[0])
                ? 'Please enter a ${widget.text.toLowerCase()}.'
                : 'Please enter an ${widget.text.toLowerCase()}';
          } else if (widget.type == InputType.Email ||
              widget.type == InputType.UFLEmail) {
            final RegExp _emailRegExp = RegExp(
              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
            );
            if (!_emailRegExp.hasMatch(value)) {
              return 'Please enter a valid email.';
            }
            if (widget.type == InputType.UFLEmail &&
                !(value.toLowerCase().contains('ufl.edu'))) {
              return 'Please enter a valid email.';
            }
          } else if (widget.type == InputType.Password) {
            if (value.length < 6) {
              return 'Invalid password.';
            }
          } else if (widget.type == InputType.Year) {
            final RegExp _numeric = RegExp(
              r'^\d{4}$',
            );
            if (!_numeric.hasMatch(value)) {
              return 'Please enter a valid year.';
            } else if (value.length != 4) {
              return 'Please enter a valid year.';
            }
          } else if (widget.type == InputType.Phone) {
            final RegExp _phone = RegExp(
              r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$',
            );
            final RegExp _phone2 = RegExp(
              r'^\d{10}$',
            );
            if (!_phone.hasMatch(value) && !_phone2.hasMatch(value)) {
              return 'Please enter a valid phone number.';
            }
          }
          //^\d{4}$
          setState(() {
            _valid = true;
          });
          return null;
        },
      ),
    );
  }
}
