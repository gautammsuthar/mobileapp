import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/util/constants.dart';

class Header extends StatefulWidget {
  const Header({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        SvgPicture.asset(
          'public/images/header.svg',
          allowDrawingOutsideViewBox: true,
        ),
        Positioned(
          top: height * 0.06,
          left: width * 0.07,
          child: Text(
            'Hi, ${widget.name}',
            textScaleFactor: 1.5,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          top: height * 0.1,
          left: width * 0.07,
          child: const Text(
            'Glad to see you here 👋',
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: height * 0.15,
          left: width * 0.07,
          child: SizedBox(
            width: width * 0.6,
            child: TextField(
              controller: _controller,
              onSubmitted: (v) {
                FocusScope.of(context).requestFocus();
              },
              cursorColor: kPrimaryColor,
              style: const TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Find Course',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.6)),
                prefixIcon: const Icon(Icons.search, color: kPrimaryColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 0.15,
          left: width * 0.71,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.swap_horiz,
              color: kPrimaryColor,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }
}
