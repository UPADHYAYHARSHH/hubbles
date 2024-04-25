import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'login.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "http://via.placeholder.com/350x150",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: Colors.green,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            useSafeArea: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      30,
                                    ),
                                    topRight: Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    16.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                color: Colors.white,
                                                width: 103,
                                                height: 2,
                                                child: const Text(
                                                  'f',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Update Name',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'What is your name?',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Change full name',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            useSafeArea: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      30,
                                    ),
                                    topRight: Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    16.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                color: Colors.white,
                                                width: 103,
                                                height: 2,
                                                child: const Text(
                                                  'f',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Update Location',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Which city do you live?',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Update location',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            useSafeArea: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      30,
                                    ),
                                    topRight: Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 16,
                                    right: 22,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            16.0,
                                          ),
                                          child: Column(
                                            children: [
                                              const Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Update Pictures',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Profile Pictures',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GridView.count(
                                                shrinkWrap: true,
                                                mainAxisSpacing: 10,
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 83,
                                                        child: DottedBorder(
                                                          color: Colors.green,
                                                          borderType:
                                                              BorderType.RRect,
                                                          dashPattern: const [
                                                            10,
                                                            10,
                                                          ],
                                                          strokeWidth: 2,
                                                          radius: const Radius
                                                              .circular(
                                                            15,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 83,
                                                        child: DottedBorder(
                                                          color: Colors.green,
                                                          borderType:
                                                              BorderType.RRect,
                                                          dashPattern: const [
                                                            10,
                                                            10,
                                                          ],
                                                          strokeWidth: 2,
                                                          radius: const Radius
                                                              .circular(
                                                            15,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 83,
                                                        child: DottedBorder(
                                                          color: Colors.green,
                                                          borderType:
                                                              BorderType.RRect,
                                                          dashPattern: const [
                                                            10,
                                                            10,
                                                          ],
                                                          strokeWidth: 2,
                                                          radius: const Radius
                                                              .circular(
                                                            15,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 83,
                                                        child: DottedBorder(
                                                          color: Colors.green,
                                                          borderType:
                                                              BorderType.RRect,
                                                          dashPattern: const [
                                                            10,
                                                            10,
                                                          ],
                                                          strokeWidth: 2,
                                                          radius: const Radius
                                                              .circular(
                                                            15,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 83,
                                                        child: DottedBorder(
                                                          color: Colors.green,
                                                          borderType:
                                                              BorderType.RRect,
                                                          dashPattern: const [
                                                            10,
                                                            10,
                                                          ],
                                                          strokeWidth: 2,
                                                          radius: const Radius
                                                              .circular(
                                                            15,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 83,
                                                        child: DottedBorder(
                                                          color: Colors.green,
                                                          borderType:
                                                              BorderType.RRect,
                                                          dashPattern: const [
                                                            10,
                                                            10,
                                                          ],
                                                          strokeWidth: 2,
                                                          radius: const Radius
                                                              .circular(
                                                            15,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Update Pictures',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          signOut();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delete Account',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Login(),
      ),
    );
  }
}
