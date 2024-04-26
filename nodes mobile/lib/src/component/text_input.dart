// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.inputType,
      this.labelText,
      this.width,
      this.label,
      this.obscureText,
      this.suffix,
      this.validator,
      this.focusNode,
      this.nextFocusNode,
      this.onTap,
      this.readOnly,
      this.onChanged
      });
  final TextEditingController controller;
  final String hintText;
  final TextInputType? inputType;
  final String? labelText;
  final double? width;
  final String? label;
  bool? obscureText;
  Widget? suffix;
  String? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  void Function()? onTap;
  bool? readOnly;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // late final theme = Theme.of(context).extension<Palette>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: readOnly ?? false,
            textAlignVertical: TextAlignVertical.center,
            obscureText: obscureText ?? false,
            controller: controller,
            style: const TextStyle(color: Color(0xFFFFFFFF)),
            keyboardType: inputType,
            cursorColor: const Color(0xFFFFFFFF),
            
            decoration: InputDecoration(
              // contentPadding: const EdgeInsets.only(bottom: -10),
              suffixIconConstraints: const BoxConstraints(maxHeight: 14),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF787F85)), // ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF787F85)),
              ),
              errorText: null,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFF787F85)),
              labelText: labelText,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: suffix,
              ),
            ),
            focusNode: focusNode,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validator;
              }
              return null;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(nextFocusNode);
            },
            onTap: onTap,
            onChanged: onChanged,
            ),
      ],
    );
  }
}
