import 'package:flutter/material.dart';
import 'package:hubbles/custom_widgets/chat_view.dart';

class HubbleScreen extends StatefulWidget {
  const HubbleScreen({super.key});

  @override
  State<HubbleScreen> createState() => _HubbleScreenState();
}

class _HubbleScreenState extends State<HubbleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Text(
                          'My Hubbles',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 2,
                          width: 60,
                          color: Colors.green,
                          child: const Text(
                            'hh',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ChatView(
                userImage:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK_nD-PRWCufs9DbJ0kjBzeVeEkTaMH9cX5g&s',
                name: 'harsh',
                msgTime: DateTime.now(),
                lastMessage: 'hey',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
