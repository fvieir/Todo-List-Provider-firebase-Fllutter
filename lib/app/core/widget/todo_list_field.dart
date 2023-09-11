import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  TodoListField({
    super.key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.validator,
  })  : assert(obscureText == true ? suffixIconButton == null : true,
            'Não é permitido utilizar obscureText junto com suffixIconButton'),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          focusNode: focusNode,
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            isDense: true,
            label: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            suffixIcon: suffixIconButton ??
                (obscureText
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextVN.value;
                        },
                        icon: Icon(
                          obscureTextValue
                              ? TodoListIcons.eyeSlash
                              : TodoListIcons.eye,
                          size: 15,
                        ),
                      )
                    : null),
          ),
        );
      },
    );
  }
}
