import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

Widget categorySlider(
    {required BuildContext context,
    required Future<List<Movie>> categorey,
    required String title}) {
  return SizedBox(
    child: FutureBuilder(
      future: categorey,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // print('errorr=>${snapshot}');
          return const Center(
            child: Text('Server Busy'),
          );
        } else if (snapshot.hasData) {
          // print('has data');
          return MainTitleCard(
            title: title,
            snapshot: snapshot,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
