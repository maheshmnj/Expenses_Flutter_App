import 'package:expense_manager/constants/exports.dart';
import 'package:flutter/material.dart';

class EMInputField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? hintText;
  final String? labelText;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final int? maxLength;
  final int? maxLines;
  final bool autoFocus;
  final TextStyle? style;
  const EMInputField(
      {Key? key,
      this.controller,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.maxLength,
      this.labelText,
      this.onSubmit,
      this.maxLines,
      this.style,
      this.autoFocus = false,
      this.onChange})
      : super(key: key);

  @override
  State<EMInputField> createState() => _EMInputFieldState();
}

class _EMInputFieldState extends State<EMInputField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  late final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      cursorColor: Theme.of(context).colorScheme.primary,
      cursorWidth: 2.5,
      keyboardType: widget.keyboardType,
      style: widget.style ?? ExpenseTheme.inputTextStyle,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autofocus: widget.autoFocus,
      onSubmitted: (x) => widget.onSubmit!(x),
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.style ?? ExpenseTheme.inputTextStyle,
        prefixStyle: widget.style ?? ExpenseTheme.inputTextStyle,
        counterText: "",
        labelText: widget.labelText,
        prefixText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: widget.style ?? ExpenseTheme.inputTextStyle,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        filled: true,
        fillColor: Colors.black38.withOpacity(0.1),
      ),
      onTap: () {},
    );
  }
}
