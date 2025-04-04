import 'package:flutter/material.dart';

class MultiSelectChips<T> extends StatefulWidget {
  final List<T> options;
  final T? value;
  final String Function(T data)? formatToLabel;
  final Function(T data, bool isSelected)? onSelect;
  const MultiSelectChips(
      {Key? key,
      required this.options,
      this.formatToLabel,
      this.onSelect,
      required this.value})
      : super(key: key);

  @override
  _MultiSelectChipsState createState() => _MultiSelectChipsState();
}

class _MultiSelectChipsState<T> extends State<MultiSelectChips<T>> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.map((choice) {
        return ChoiceChip(
          label: Text(widget.formatToLabel != null
              ? widget.formatToLabel!(choice)
              : choice.toString()),
          selected: widget.value == choice,
          onSelected: (selected) {
            setState(() {
              if (widget.onSelect != null) {
                widget.onSelect!(choice, selected);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
