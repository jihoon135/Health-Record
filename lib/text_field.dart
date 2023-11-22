import 'package:flutter/material.dart';

class Text_Form_Field extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget prefixIcon;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final Widget suffixIcon;
  const Text_Form_Field(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.obscureText,
      required this.keyboardType,
      required this.prefixIcon,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.errorText,
      required this.suffixIcon});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<Text_Form_Field> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        controller: widget.controller,
        onSaved: widget.onSaved,
        validator: widget.validator,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.left,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          errorText: widget.errorText,
          errorStyle: const TextStyle(
            //validation 오류 텍스트
            color: Color.fromARGB(255, 255, 178, 178),
            fontSize: 16,
          ),
          focusedErrorBorder: OutlineInputBorder(
            //Textformfield을 안눌렀을때 반응
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            //Textformfield을 안눌렀을때 반응
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            //TEXTFORMFIELD를 눌렀을때 반응
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            //TEXTFORMFIELD를 눌렀을때 반응
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: widget.suffixIcon,
          fillColor: Colors.black,
          filled: true,
          labelText: widget.labelText,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: widget.prefixIcon,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
