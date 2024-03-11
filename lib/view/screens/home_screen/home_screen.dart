import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/models/project_model.dart';
import 'package:skill_sync/models/user_model.dart';
import 'package:skill_sync/view/components/containers/project_container.dart';
import 'package:skill_sync/view/components/custom_drawer.dart';
import 'package:skill_sync/view/screens/projects_screen/add_project_screen.dart';
import 'package:skill_sync/view/screens/projects_screen/bottom_sheets/project_filter_bottom_sheet.dart';

import '../../routes/route_animations.dart';
import '../auth_screen/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  UserModel user = UserModel(
    id: '1',
    email: 'vasusomani2004@gmail.com',
    name: 'Vasu Somani',
    age: 17,
    gender: "Male",
    phoneNumber: 9587118642,
    occupation: "Student",
    level: "Beginner",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 50,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
                height: 27,
                color: CustomColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding:
                const EdgeInsets.only(bottom: kBottomNavigationBarHeight + 20),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ProjectContainer(
                  project: ProjectModel(
                    title: 'Project $index',
                    description:
                        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Veniam deleniti dolor voluptatum a eos accusamus maxime esse similique laudantium vero commodi sunt ullam facilis numquam soluta quos, repudiandae veritatis animi!',
                    skills: [
                      'Skill 1',
                      'Skill 2',
                      'Skill 3',
                      'Skill 4',
                      'Skill 5',
                      'Skill 6',
                      'Skill 7',
                    ],
                    duration: 30,
                    id: index.toString(),
                    userId: index.toString(),
                    userName: "Vasu Somani",
                    domain: 'Development',
                    subDomain: 'Web Development',
                    startDate: DateTime.now(),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primaryColor.withOpacity(0.6),
                      offset: const Offset(3, 4),
                      blurRadius: 0,
                    )
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/chat.svg',
                        height: 35,
                        color: CustomColors.primaryColor,
                      ),
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/recent_chats',
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/add.svg',
                        height: 45,
                        color: CustomColors.primaryColor,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        CustomRoute(
                            page: const AddProjectScreen(),
                            animationType: "slideUp"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        size: 35,
                        color: CustomColors.primaryColor,
                      ),
                      onPressed: () => projectFilterBottomSheet(context),
                    ),
                  ],
                )),
          ),
        ],
      ),
      drawer: SafeArea(
        child: CustomDrawer(user: user),
      ),
    );
  }
}
