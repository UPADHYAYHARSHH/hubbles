import 'package:flutter/material.dart';
import 'package:hubbles/custom_widgets/other_user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OtherUser(
          userImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPC8mqIGZbAbkCpaOx0aFlsk-KDMABJgR07Q&usqp=CAU',
          name: 'harsh',
          location: 'rajkot',
          age: 23,
          channelImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPC8mqIGZbAbkCpaOx0aFlsk-KDMABJgR07Q&usqp=CAU',
          videoImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPC8mqIGZbAbkCpaOx0aFlsk-KDMABJgR07Q&usqp=CAU',
          channelName: 'vdvd',
          videoTile: 'avd',
          isEdit: true,
          isBack: true,
          isMore: false,
          isLikeButton: false,
          isSyncButton: true,
        ),
      ),
    );
  }
}
