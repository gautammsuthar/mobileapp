import 'package:flutter/material.dart';

import '../util/constants.dart';

class TopicContainer extends StatelessWidget {
  const TopicContainer({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.topic,
    required this.backgroundColor,
  }) : super(key: key);

  final IconData icon;
  final bool isSelected;
  final String topic;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: Card(
        elevation: isSelected ? 2 : 4,
        color: isSelected ? kPrimaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: isSelected ? Colors.white : backgroundColor,
                child: Icon(
                  icon,
                  color: isSelected ? kPrimaryColor : Colors.white,
                  size: 30,
                ),
              ),
              Text(
                topic,
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
