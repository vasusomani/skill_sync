import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/models/project_model.dart';
import 'package:skill_sync/models/user_model.dart';
import 'package:skill_sync/view/components/containers/project_container.dart';

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
            child: SvgPicture.asset(
              'assets/icons/profile.svg',
              height: 27,
              color: CustomColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
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
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/add.svg',
                        height: 45,
                        color: CustomColors.primaryColor,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        size: 35,
                        color: CustomColors.primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
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
              SizedBox(height: 10),
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
                        color: CustomColors.secondaryColor1,
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
                    SizedBox(width: 5),
                    Text("|",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: CustomColors.secondaryColor1,
                              fontWeight: FontWeight.bold,
                            )),
                    SizedBox(width: 5),
                    Text(
                      user.projects?.length.toString() ?? "5" + " Projects",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.secondaryColor1,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                color: CustomColors.secondaryColor1,
                indent: 15,
                endIndent: 15,
              ),
              SizedBox(
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
              SizedBox(
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
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Icon(CupertinoIcons.briefcase_fill,
                    size: 30, color: CustomColors.primaryColor),
                title: Text(
                  'My Projects',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.primaryColor,
                      ),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Icon(Icons.leaderboard_outlined,
                    size: 30, color: CustomColors.primaryColor),
                title: Text(
                  'Leaderboard',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.primaryColor,
                      ),
                ),
                onTap: () {},
              ),
              SizedBox(
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
        ),
      ),
    );
  }
}
