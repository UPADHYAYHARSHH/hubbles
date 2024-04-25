import 'package:flutter/material.dart';

import 'custom_widgets/other_user.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            bottom: const TabBar(
              indicatorColor: Colors.green,
              automaticIndicatorColorAdjustment: true,
              dividerColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Doubles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Hubbles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 200,
                    top: 100,
                    child: Icon(
                      Icons.tune,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  OtherUser(
                    userImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Jp2ggb8amIkmL6BEC544NRu4BkwIFZrIhg&s',
                    name: 'harsh',
                    location: 'Rajkot, gujarat',
                    age: 23,
                    channelImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOaIoJnZo7V1UbrmEvfcUhs0VHnFC5FkNbxA&s',
                    videoImage:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOaIoJnZo7V1UbrmEvfcUhs0VHnFC5FkNbxA&s',
                    channelName: 'MTV',
                    videoTile: 'Mtv',
                    isMore: true,
                    isEdit: false,
                    isBack: false,
                    isLikeButton: true,
                    isSyncButton: false,
                  ),
                ],
              ),
              OtherUser(
                userImage:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Jp2ggb8amIkmL6BEC544NRu4BkwIFZrIhg&s',
                name: 'harsh',
                location: 'Rajkot, gujarat',
                age: 23,
                channelImage:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOaIoJnZo7V1UbrmEvfcUhs0VHnFC5FkNbxA&s',
                videoImage:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOaIoJnZo7V1UbrmEvfcUhs0VHnFC5FkNbxA&s',
                channelName: 'MTV',
                videoTile: 'Mtv',
                isEdit: false,
                isBack: false,
                isMore: true,
                isLikeButton: true,
                isSyncButton: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
