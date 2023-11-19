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
  const Text_Form_Field({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    required this.prefixIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

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
          errorStyle: const TextStyle(
            color: Colors.white, // 오류 메시지의 텍스트 색상
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.black,
          filled: true,
          labelText: widget.labelText,
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: widget.prefixIcon,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          // suffixIcon: widget.controller.text.isEmpty
          //     ? null
          //     : IconButton(
          //         icon: const Icon(Icons.clear, color: Colors.white),
          //         onPressed: () {
          //           setState(() {
          //             widget.controller.clear();
          //           });
          //         },
          //       ),
        ),
      ),
    );
  }
}
