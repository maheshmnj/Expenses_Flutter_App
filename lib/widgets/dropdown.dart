import 'package:expense_manager/constants/exports.dart';
import 'package:expense_manager/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final Function(T) onChanged;
  final T? value;
  final Widget Function(T) dropdownItem;

  const EmDropdownButton(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.dropdownItem,
      required this.value})
      : super(key: key);

  @override
  State<EmDropdownButton<T>> createState() => _EmDropdownButtonState();
}

class _EmDropdownButtonState<T> extends State<EmDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    final primary = ExpenseTheme.colorScheme.primary;
    return Container(
      alignment: Alignment.center,
      height: 52,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: primary, width: 2),
          color: primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: DropdownButton<T>(
        value: widget.value,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: primary),
        iconSize: 32,
        style: ExpenseTheme.textTheme.subtitle2!
            .copyWith(color: primary, fontSize: 15),
        underline: SizedBox(),
        onChanged: (T? newValue) => widget.onChanged(newValue!),
        menuMaxHeight: 200,
        items: widget.items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
              value: value, child: widget.dropdownItem(value));
        }).toList(),
      ),
    );
  }
}
