import 'package:flutter/material.dart';

class PickerColumn extends StatefulWidget {
  final String label;
  final int min;
  final int max;
  final int initial;
  final void Function(int) onChanged;

  const PickerColumn({
    super.key,
    required this.label,
    required this.min,
    required this.max,
    required this.initial,
    required this.onChanged,
  });

  @override
  State<PickerColumn> createState() => _PickerColumnState();
}

class _PickerColumnState extends State<PickerColumn> {
  late int selected;
  late FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    selected = widget.initial;
    controller = FixedExtentScrollController(
      initialItem: widget.initial - widget.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(
          height: 150,
          width: 60,
          child: ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 36,
            perspective: 0.003,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              final value = index + widget.min;
              setState(() => selected = value);
              widget.onChanged(value);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.max - widget.min + 1,
              builder: (context, index) {
                final value = index + widget.min;
                final isSelected = value == selected;

                return Center(
                  child: Text(
                    value.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
