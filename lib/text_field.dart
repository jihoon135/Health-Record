import 'package:flutter/material.dart';

class Text_Field extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget prefixIcon;

  const Text_Field({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  _Text_FieldState createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _updateTextEmptyState();
  }

  void _updateTextEmptyState() {
    setState(() {
      _isTextEmpty = widget.controller.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.left,
        onChanged: (value) {
          _updateTextEmptyState();
        },
        decoration: InputDecoration(
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
          suffixIcon: _isTextEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      widget.controller.clear();
                      _updateTextEmptyState();
                    });
                  },
                ),
        ),
      ),
    );
  }
}
