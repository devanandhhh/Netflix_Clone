import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';

import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<Movie>> commingSoon; 
  late Future<List<Movie>> everyOneWatching;

  @override
  void initState() {
    super.initState();
    commingSoon = Api().getTrendingMovies();
    everyOneWatching = Api().getSouthIndianCinemas();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
              title: Text(
                'New & Hot',
                style: GoogleFonts.montserrat()
                    .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(Icons.cast),
                kwidth,
                Container(
                  color: Colors.blue,
                  width: 30,
                  height: 30,
                ),
                kwidth
              ],
              bottom: TabBar(
                isScrollable: true,
                labelColor: kblackColor,
                unselectedLabelColor: kwhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(borderRadius: kRadius30, color: kwhiteColor),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon ',
                  ),
                  Tab(
                    text: "👀 EveryOne's Watching",
                  )
                ],
              )),
        ),
        body: TabBarView(children: [
          buildComingSoon(commingSoon),
          buildEveryOneWatching(everyOneWatching)
        ]),
      ),
    );
  }

  Widget buildComingSoon(Future<List<Movie>> commingSoon) {
    return FutureBuilder(
      future: commingSoon,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Text('Server Busy');
        } else {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final movies = snapshot.data![index]; 
                return ComingSoonWidget(
                  movie: movies,
                );
              });
        }
      },
    );
  }

  Widget buildEveryOneWatching(Future<List<Movie>> everyOneWatching) {
    return FutureBuilder(
      future: everyOneWatching,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Text('Server Busy');
        } else {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final movies = snapshot.data![index];
                return EveryOneWatchingWidget(
                  movie: movies,
                );
              });
        }
      },
    );
  }
}
