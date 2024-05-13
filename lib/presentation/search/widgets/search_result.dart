import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageurl =
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/941f52133698221.61c36c24decd0.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key,required this.snapshot});
 final AsyncSnapshot snapshot ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1/1.5,
          children: List.generate(snapshot.data.length, (index) {
            return  MainCard(snapshot: snapshot.data[index],);
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key,required this.snapshot,});
final Movie snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(7), 
          image: DecorationImage(
              image: NetworkImage('${Constants.imagePath}${snapshot.backdropPath}'), fit: BoxFit.cover)),
    );
  }
}
