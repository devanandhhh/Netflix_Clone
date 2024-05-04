import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: GoogleFonts.montserrat()
              .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
        ),
       const Spacer(),
       const Icon(Icons.cast),
        kwidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kwidth
      ],
    );
  }
}
