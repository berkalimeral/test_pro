import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final Widget icon;
  bool visible;
  final TextEditingController controller;
  MyTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.visible,
    required this.controller,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.length < 4) {
          return 'Password en az 4 karakter olmalı!';
        } else {
          return null;
        }
      },
      obscureText: widget.visible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: widget.icon,
          onPressed: () {
            setState(() {
              widget.visible = !widget.visible;
            });
          },
        ),
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class MyTextFormFieldEmail extends StatefulWidget {
  final String labelText;
  final Widget icon;
  final TextEditingController controller;
  const MyTextFormFieldEmail({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  State<MyTextFormFieldEmail> createState() => _MyTextFormFieldEmailState();
}

class _MyTextFormFieldEmailState extends State<MyTextFormFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (!EmailValidator.validate(value!)) {
          return 'Geçerli Mail Giriniz!';
        } else {
          null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: widget.icon,
          onPressed: () {},
        ),
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
