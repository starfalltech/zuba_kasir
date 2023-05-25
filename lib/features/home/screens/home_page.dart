import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/core/constants/color_value.dart';
import 'package:zuba_karis/features/home/widget/menu_grid_widget.dart';
import 'package:zuba_karis/features/home/widget/selected_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Menu"),
              const SizedBox(
                width: 12,
              ),
              DropdownButton<String>(
                value: list.first,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: ColorValue.primary,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Expanded(child: MenuGridWidget()),
      ],
    );
  }
}
