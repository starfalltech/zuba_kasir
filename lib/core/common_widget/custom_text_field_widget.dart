import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zuba_karis/core/constants/color_value.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator validator;
  final bool obsecure;
  final Widget? icon;
  final TextInputType inputType;

  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.obsecure,
    this.icon,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.inputType,
        controller: widget.controller,
        obscureText: widget.obsecure && hidepassword,
        decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            labelText: widget.label,
            filled: true,
            prefixIcon: widget.icon,
            prefixIconConstraints: const BoxConstraints(),
            fillColor: ColorValue.textFieldFill,
            suffixIcon: widget.obsecure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hidepassword = !hidepassword;
                      });
                    },
                    icon: hidepassword
                        ? const Icon(CupertinoIcons.eye_solid)
                        : const Icon(CupertinoIcons.eye_slash),
                  )
                : const SizedBox()),
      ),
    );
  }
}
