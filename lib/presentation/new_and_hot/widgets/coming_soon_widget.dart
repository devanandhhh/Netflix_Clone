
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 60,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          height: 500,
          width: size.width - 60,
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
               Row(
                children: [
                  Text(
                    'The Boys',
                    style: TextStyle(letterSpacing: -9,
                      fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.all_out_sharp,
                        title: 'Reminder me',
                        iconsize: 20,
                        textsize: 13,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'info',
                        iconsize: 20,
                        textsize: 13,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              //kheight,
              Text('Coming on Friday'),
              kheight,
              Text(
                'The Boys',
                style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
              ),
               Text(
                'These boys are going a trip and one boy was missing and the friends searching the friend name is subash and at the climax the friends find the subash',
                style: TextStyle(color: kGreyColor),
              ),
               
             
            ],
          ),
        ),
      ],
    );
  }
}


