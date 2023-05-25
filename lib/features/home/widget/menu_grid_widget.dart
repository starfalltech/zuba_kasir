import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zuba_karis/core/constants/color_value.dart';

class MenuGridWidget extends StatelessWidget {
  const MenuGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: GridView.builder(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorValue.blueSecond,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14)),
                    child: Image.network(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        'https://dcostseafood.id/wp-content/uploads/2022/04/Nasi-Goreng-spesial.jpg'),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'nasi Goreng',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Text(
                        'Rp.30.000',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
