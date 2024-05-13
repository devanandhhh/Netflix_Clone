import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

// ignore: must_be_immutable
class MainCard1 extends StatelessWidget {
   MainCard1({
    super.key,this.snapshot, this.index
  });
  int? index ;
final AsyncSnapshot? snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(1),
      height: 250,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          color: Colors.red,
          image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                // 'https://m.media-amazon.com/images/M/MV5BODI5NDUxNjAtZTIxYS00N2M1LWI5NmItODBmM2QyNTU4ZDY4XkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_FMjpg_UX1000_.jpg'
                 '${Constants.imagePath}${snapshot!.data[index].posterPath}' ))),
    );
  }
}