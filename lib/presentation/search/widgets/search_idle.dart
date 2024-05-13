import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';

import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageurl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxQ1RAjgG-GvD49MMO4F9bC_MT46ppGWsRwTjSiPglXQ&s';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  late Future<List<Movie>> searchidle;
  @override
  void initState() {
    super.initState();
    searchidle = Api().getSearchPageIdle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
          child: FutureBuilder(
            future: searchidle,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }if(snapshot.hasError){
                return Text('server busy');
              }
               else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) => TopSearchItemTile(
                          snapshot: snapshot,
                          index: index,
                        ),
                    separatorBuilder: (ctx, index) => kheight20,
                    itemCount: snapshot.data!.length);
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key, required this.index, required this.snapshot});
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                  image: NetworkImage(
                      '${Constants.imagePath}${snapshot.data[index].posterPath}'),
                  fit: BoxFit.cover)),
        ),kwidth,  
         Expanded(
            child: Text(
          // 'Movie Name',
          snapshot.data[index].title,
          style:const TextStyle(
              color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kblackColor,
            radius: 23,
            child: Center(
                child: Center(
                    child: Icon(
              CupertinoIcons.play_fill,
              color: kwhiteColor,
            ))),
          ),
        )
      ],
    );
  }
}
