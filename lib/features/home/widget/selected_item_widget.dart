import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/core/constants/color_value.dart';
import 'package:zuba_karis/features/home/widget/menu_item_select_widget.dart';

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: ColorValue.borderColor,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Menu Pesanan',
              style: GoogleFonts.quicksand(
                color: const Color(0xff2C3832),
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 2,
              margin: const EdgeInsets.only(top: 18),
              color: ColorValue.borderColor,
            ),
            const SizedBox(
              height: 22,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (c, i) => MenuItemSelectWidget(),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 19,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: 2,
                  color: ColorValue.borderColor,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                        '\$38,50',
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 19,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "BATALKAN",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 6.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 19,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                              color: ColorValue.blueSecond,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "KIRIM",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 6.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
