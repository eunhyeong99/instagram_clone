import 'package:flutter/material.dart';
import 'package:instagram_clone/src/components/avatar_widget.dart';
import 'package:instagram_clone/src/components/image_data.dart';
import 'package:instagram_clone/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          thumbPath:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9MqVVe9k2M-Bxs9KDWYqPDjkUlf8PacL3gQ&usqp=CAU',
          size: 70,
          type: AvatarType.TYPE2,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style:
                    TextStyle(fontSize: 20, color: Colors.white, height: 1.1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(20, (index) => PostWidget()).toList(),
    );
  }

  Widget _StoryBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
          100,
          (index) => AvatarWidget(
              thumbPath:
                  'https://gdimg.gmarket.co.kr/2005140696/still/600?ver=1684989668',
              type: AvatarType.TYPE1),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageData(icon: IconsPath.logo, width: 270),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(icon: IconsPath.directMessage, width: 50),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _StoryBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
