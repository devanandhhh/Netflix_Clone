import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/api/api.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/category_slider.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';

//import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

late Future<List<Movie>> trendingMovies;
late Future<List<Movie>> top10movies;
late Future<List<Movie>> tenseDrama;
late Future<List<Movie>> southIndianCinemas;

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    top10movies = Api().getTop10Movies();
    tenseDrama = Api().getTenseDrama();
    southIndianCinemas = Api().getSouthIndianCinemas();
  }

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
              children: [
                const BackgroundCard(),
                categorySlider(
                    context: context,
                    categorey: trendingMovies,
                    title: 'Trending Movies'),
                SizedBox(
                  child: FutureBuilder(
                    future: top10movies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child:
                              Text('Errror  ===${snapshot.error.toString()}'),
                        );
                      } else if (snapshot.hasData) {
                        return NumberTitleCard(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                kheight,
                categorySlider(
                    context: context,
                    categorey: tenseDrama,
                    title: 'Tense Drama '),
                kheight,
                categorySlider(
                    context: context,
                    categorey: southIndianCinemas,
                    title: 'South Indian Cinemas')
              ],
            ),
            scrollNotifier.value == true
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
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
                                // 'https://m.media-amazon.com/images/M/MV5BMDZkYmVhNjMtNWU4MC00MDQxLWE3MjYtZGMzZWI1ZjhlOWJmXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg'
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'TV Show',
                              style: kHomeTitleText,
                            ),
                            Text(
                              'Movies',
                              style: kHomeTitleText,
                            ),
                            Text(
                              'Category',
                              style: kHomeTitleText,
                            )
                          ],
                        )
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
