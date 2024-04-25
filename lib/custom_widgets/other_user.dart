import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hubbles/edit_profile.dart';

class OtherUser extends StatefulWidget {
  const OtherUser({
    super.key,
    required this.userImage,
    required this.name,
    required this.location,
    required this.age,
    required this.channelImage,
    required this.videoImage,
    required this.channelName,
    required this.videoTile,
    required this.isEdit,
    required this.isBack,
    required this.isMore,
    required this.isLikeButton,
    required this.isSyncButton,
  });

  final String userImage;
  final String name;
  final String location;
  final int age;
  final String channelImage;
  final String videoImage;
  final String channelName;
  final String videoTile;
  final bool isEdit;
  final bool isBack;
  final bool isMore;
  final bool isLikeButton;
  final bool isSyncButton;

  @override
  State<OtherUser> createState() => _OtherUserState();
}

class _OtherUserState extends State<OtherUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                width: double.infinity,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.28,
                widget.userImage,
              ),
              if (widget.isBack)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 8,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.isEdit)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 20.0,
                      top: 8,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit_square,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (widget.isMore)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    top: 8,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: 160,
                top: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.age.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isLikeButton)
                Positioned(
                  left: 360,
                  top: 210,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                    ),
                    child: const Icon(
                      Icons.thumb_up_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Mutual subscribed channel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.transparent,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: widget.channelImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 2,
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.channelName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Mutual liked videos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 160,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: CachedNetworkImage(
                            // fit: Bo xfit.cover,
                            imageUrl: widget.videoImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 2,
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.videoTile,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.isSyncButton)
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.loop,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sync youtube profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
