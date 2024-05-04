import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';

import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true); 

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      builder: (context, value, child) =>
          NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          print(direction);
          if (direction == ScrollDirection.reverse) {
            scrollNotifier.value = false;
          } else if (direction == ScrollDirection.forward) {
            scrollNotifier.value = true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children: const [
                BackgroundCard(),
                MainTitleCard(title: 'Released in the past year'),
                kheight,
                MainTitleCard(
                  title: 'Trending Now',
                ),
                kheight,
                NumberTitleCard(),
                kheight,
                MainTitleCard(title: 'Tense Drama'),
                kheight,
                MainTitleCard(title: 'South Indian Cinemas')
              ],
            ),
            scrollNotifier.value == true
                ? AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                    width: double.infinity,
                    height: 80,
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(
                                'https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456',
                                height: 40,
                                width: 60,
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
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [ 
                          Text('TV Show',style:kHomeTitleText,), 
                          Text('Movies',style: kHomeTitleText,),
                          Text('Category',style: kHomeTitleText,) 
                        ],)
                      ],
                    ),
                  )
                : kheight
          ],
        ),
      ),
      valueListenable: scrollNotifier,
    ));
  }
}
