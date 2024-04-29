import 'dart:developer';

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bottom_bar.dart';

class Registration extends StatefulWidget {
  const Registration({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final PageController _controller = PageController();
  final TextEditingController nameController = TextEditingController();

  int _currentIndex = 0;

  String? name;
  DateTime selectedDate = DateTime.now();
  String? gender = '';
  String? location = '';
  String _locationMessage = '';
  File? _image;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateIndex);
    name = widget.name;
    _getLocationPermission();
  }

  void _updateIndex() {
    setState(() {
      _currentIndex = _controller.page!.round();
    });
  }

  Future<void> _getImage() async {
    // Check and request permission
    PermissionStatus permissionStatus = await Permission.photos.request();
    if (permissionStatus.isGranted) {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedImage != null) {
          _image = File(pickedImage.path);
        } else {
          print('No image selected.');
        }
      });
    } else {
      print('Permission denied.');
    }
  }

  _getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle accordingly.
        setState(() {
          _locationMessage = 'Location permissions are denied.';
        });
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, request open settings.
      setState(() {
        _locationMessage =
            'Location permissions are permanently denied, we cannot request permissions.';
      });
      return;
    }

    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _locationMessage =
            '${place.locality},${place.administrativeArea},${place.country}';
        location = _locationMessage;
        log('_locationMessage-->$_locationMessage');
      });
    } catch (e) {
      setState(() {
        _locationMessage = 'Could not get location: $e';
      });
    }
  }

  @override
  void dispose() {
    // Dispose the PageController when not needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_currentIndex != 0)
                InkWell(
                  onTap: () {
                    setState(() {
                      _controller.previousPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.ease,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: Colors.green.shade500,
                    ),
                    child: const Icon(
                      Icons.arrow_left,
                      size: 40,
                    ),
                  ),
                ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: _currentIndex >= 0 ? 20 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: _currentIndex >= 0
                          ? Colors.green.shade500
                          : Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 10,
                    width: _currentIndex >= 1 ? 20 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      border: Border.all(
                        color: _currentIndex < 1
                            ? Colors.green.shade500
                            : Colors.transparent,
                      ),
                      color: _currentIndex >= 1
                          ? Colors.green.shade500
                          : Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 10,
                    width: _currentIndex >= 2 ? 20 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      border: Border.all(
                        color: _currentIndex < 2
                            ? Colors.green.shade500
                            : Colors.transparent,
                      ),
                      color: _currentIndex >= 2
                          ? Colors.green.shade500
                          : Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 10,
                    width: _currentIndex >= 3 ? 20 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      border: Border.all(
                        color: _currentIndex < 3
                            ? Colors.green.shade500
                            : Colors.transparent,
                      ),
                      color: _currentIndex >= 3
                          ? Colors.green.shade500
                          : Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 10,
                    width: _currentIndex >= 4 ? 20 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      border: Border.all(
                        color: _currentIndex < 4
                            ? Colors.green.shade500
                            : Colors.transparent,
                      ),
                      color: _currentIndex >= 4
                          ? Colors.green.shade500
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (index) {},
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'What is your name?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      initialValue: widget.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          // Underline border
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ), // Underline color
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          name = nameController.text;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "When's your birthday?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          DatePickerWidget(
                            onChange:
                                (DateTime dateTime, List<int> selectedIndex) {
                              setState(() {
                                selectedDate = dateTime;
                              });
                            },
                            pickerTheme: const DateTimePickerTheme(
                              backgroundColor: Colors.black,
                              dividerColor: Colors.green,
                              itemTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            lastDate: DateTime.now(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "What's your gender?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                gender = 'Male';
                              });
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: gender == 'Male'
                                    ? Colors.green
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                              height: 52,
                              child: const Center(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                gender = 'Female';
                              });
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: gender == 'Female'
                                    ? Colors.green
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                              height: 52,
                              child: const Center(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                gender = 'Other';
                              });
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: gender == 'Other'
                                    ? Colors.green
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                              height: 52,
                              child: const Center(
                                child: Text(
                                  'Other',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Which city do you live?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: _locationMessage,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                // Underline border
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ), // Underline color
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Profile picture",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _image != null
                              ? SizedBox(
                                  height: 350,
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  child: DottedBorder(
                                    color: Colors.green,
                                    borderType: BorderType.RRect,
                                    dashPattern: const [
                                      10,
                                      10,
                                    ],
                                    strokeWidth: 2,
                                    radius: const Radius.circular(
                                      120,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.green,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 90.0,
                                            ),
                                            child: Text(
                                              'Choose a photo for your profile picture',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Image.file(_image!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      if (_currentIndex < 4) {
                        setState(
                          () {
                            if (_currentIndex == 0 && name == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter your name',
                                  ),
                                  duration: Duration(seconds: 4),
                                ),
                              );
                            } else if (_currentIndex == 1 &&
                                selectedDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please select your birthdate',
                                  ),
                                  duration: Duration(seconds: 4),
                                ),
                              );
                            } else if (gender == '' && _currentIndex == 2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please select your gender',
                                  ),
                                  duration: Duration(seconds: 4),
                                ),
                              );
                            } else if (location == '' && _currentIndex == 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter your location',
                                  ),
                                  duration: Duration(seconds: 4),
                                ),
                              );
                            } else {
                              _controller.nextPage(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.ease,
                              );
                            }
                          },
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BottomBar(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          color: Colors.green.shade500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentIndex == 4 ? 'Finish' : 'Next',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
