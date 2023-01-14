import 'package:flutter/material.dart';
class MenuGridWidget extends StatelessWidget {
  const MenuGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return Container(
          width: 100,
          height: 100,
          color: Colors.grey,
        );
      },
    );
  }
}
