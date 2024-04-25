import 'package:flutter/material.dart';
import 'package:hubbles/custom_widgets/other_user.dart';

import 'custom_widgets/chat_view.dart';

class DoubleScreen extends StatefulWidget {
  const DoubleScreen({super.key});

  @override
  State<DoubleScreen> createState() => _DoubleScreenState();
}

class _DoubleScreenState extends State<DoubleScreen> {
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
                    'My Doubles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: ChatView(
                  userImage:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK_nD-PRWCufs9DbJ0kjBzeVeEkTaMH9cX5g&s',
                  name: 'harsh',
                  msgTime: DateTime.now(),
                  lastMessage: 'helo',
                ),
              ),
              const OtherUser(
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
