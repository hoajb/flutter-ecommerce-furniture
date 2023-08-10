import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/theme/styles.dart';

const _avatarSize = 25.0;

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: _avatarSize,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_avatarSize),
            child: Image.asset(
              'assets/images/ic_avatar.jpg',
              fit: BoxFit.cover,
              width: _avatarSize * 2,
              height: _avatarSize * 2,
            ),
          ),
        ),
        const SizedBox(width: 15),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning 👋',
                style: TextStyle(fontSize: 16, color: Styles.grayColor),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Black Pink',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bell,
            )),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.heart,
            )),
      ],
    );
  }
}
