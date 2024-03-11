import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_sync/models/user_model.dart';

import '../../constants/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: CustomColors.primaryColor,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomColors.primaryColor,
                  width: 2,
                ),
              ),
              child: FittedBox(
                child: Text(
                  user.name![0],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.primaryColor,
                      ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              user.name!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.level!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: CustomColors.secondaryColor1,
                      ),
                ),
                const SizedBox(width: 5),
                Text("|",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: CustomColors.secondaryColor1,
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(width: 5),
                Text(
                  user.projects?.length.toString() ?? "5" " Projects",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: CustomColors.secondaryColor1,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(
            color: CustomColors.secondaryColor1,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/profile.svg',
              height: 30,
              color: CustomColors.primaryColor,
            ),
            title: Text(
              'My Profile',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.primaryColor,
                  ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/request.svg',
              height: 30,
              color: CustomColors.primaryColor,
            ),
            title: Text(
              'My Requests',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.primaryColor,
                  ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.briefcase_fill,
                size: 30, color: CustomColors.primaryColor),
            title: Text(
              'My Projects',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.primaryColor,
                  ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.leaderboard_outlined,
                size: 30, color: CustomColors.primaryColor),
            title: Text(
              'Leaderboard',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.primaryColor,
                  ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/logout.svg',
              height: 30,
              color: Colors.red,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
