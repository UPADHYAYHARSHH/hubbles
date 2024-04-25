import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
    required this.userImage,
    required this.name,
    required this.msgTime,
    required this.lastMessage,
  });

  final String userImage;
  final String name;
  final DateTime msgTime;
  final String lastMessage;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SizedBox(
                  width: 100,
                  child: SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Remove',
                  ),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  widget.userImage,
                ),
              ),
              title: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                widget.lastMessage,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              trailing: Text(
                widget.msgTime.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
            thickness: .8,
          ),
        ],
      ),
    );
  }
}
