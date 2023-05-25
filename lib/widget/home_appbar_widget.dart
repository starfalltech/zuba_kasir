import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TitleNavWidget extends StatelessWidget {
  const TitleNavWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.account_circle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'user name',
                    style: GoogleFonts.poppins(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'user Role',
                    style: GoogleFonts.poppins(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
