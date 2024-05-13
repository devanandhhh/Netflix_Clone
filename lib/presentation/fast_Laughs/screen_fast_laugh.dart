import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/fast_Laughs/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView( 
            scrollDirection: Axis.vertical, 
        children: List.generate(kvideos.length, (index) => VideoListItem(index: index,videoUrl: kvideos[index],)),
      )),
    ); 
  }
}
