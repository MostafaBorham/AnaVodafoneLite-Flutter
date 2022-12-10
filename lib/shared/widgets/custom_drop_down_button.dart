import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({Key? key, required this.items, this.defaultValue, this.onChanged}) : super(key: key);
  final List<String> items;
  final String? defaultValue;
  final ValueChanged? onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: Theme.of(context).textTheme.labelMedium,
              value : defaultValue,
              isDense: true,
              iconSize: 30,
              iconEnabledColor: Colors.grey.shade400,
              icon: Icon(Icons.keyboard_arrow_down_rounded,),
              items: items.map((item) => DropdownMenuItem<String>(child: Text(item),value: item,)).toList(), onChanged: onChanged),
        ),
      ),
    );
  }
}
