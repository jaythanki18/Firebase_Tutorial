import 'package:flutter/material.dart';
import '../data.dart';
import 'package:smartclass/widgets/widgets.dart';
import 'package:flutter/src/widgets/sliver.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index){
                  final video=videos[index];
                  return VideoCard(video:video);
                },
              //childCount=videos.length,
            ),
          )
        ],
      ),
    );
  }
}
