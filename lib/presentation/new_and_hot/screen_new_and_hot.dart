import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

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
        body:
            TabBarView(children: [buildComingSoon(), buildEveryOneWatching()]),
      ),
    );
  }

  Widget buildComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ComingSoonWidget());
  }

  Widget buildEveryOneWatching() {
    return ListView.builder( itemCount: 10, itemBuilder: ( (BuildContext context, index) =>const EveryOneWatchingWidget()));
  }
}

