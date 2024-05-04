import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final widgetList = [const SmartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (ctx,index)=>widgetList[index],
       separatorBuilder: (ctx,index)=>const SizedBox(height: 28,),
        itemCount: widgetList.length)
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxQ1RAjgG-GvD49MMO4F9bC_MT46ppGWsRwTjSiPglXQ&s',
    'https://i.pinimg.com/736x/32/71/0a/32710a972231979879576d792cf02e7c.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/941f52133698221.61c36c24decd0.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you ,so there's\n  always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.38,
              ),
              DownloadsImageWidgets(
                imageList: imageList[0],
                margin: EdgeInsets.only(left: 170,top:40),
                angle: 25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidgets(
                imageList: imageList[1],
                margin: EdgeInsets.only(right: 170,top: 40),
                angle: -25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidgets(
                imageList: imageList[2],
                radius: 10,
                margin: EdgeInsets.only(bottom: 20,top: 30),
                size: Size(size.width * 0.44, size.width * 0.6),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kwhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    //  final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          // margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                  image: NetworkImage(imageList), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
