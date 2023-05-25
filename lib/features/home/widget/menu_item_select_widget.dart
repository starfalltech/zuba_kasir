import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/core/constants/color_value.dart';

class MenuItemSelectWidget extends StatelessWidget {
  const MenuItemSelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xffEAF0F0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
                width: 65,
                height: 65,
                fit: BoxFit.cover,
                'https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90'),
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'chicken wings',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 7.sp,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    'Rp.30.000',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'x1',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 7.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 24,
              color: Colors.redAccent,
              Icons.delete,
            ),
          )
        ],
      ),
    );
  }
}
