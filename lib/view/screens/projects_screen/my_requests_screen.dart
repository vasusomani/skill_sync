import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/project_model.dart';
import '../../components/containers/project_container.dart';

class MyRequestsScreen extends StatefulWidget {
  const MyRequestsScreen({Key? key}) : super(key: key);

  @override
  _MyRequestsScreenState createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Requests'),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.white,
          labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: CustomColors.primaryColor,
              ),
          indicatorColor: CustomColors.primaryColor.withOpacity(0.8),
          dividerHeight: 1,
          labelColor: CustomColors.primaryColor,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(
              text: 'Pending',
            ),
            Tab(text: 'Accepted'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (int i = 0; i < 2; i++)
            ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ProjectContainer(
                    isRequested: true,
                    project: ProjectModel(
                      requestAccepted: i == 0 ? false : true,
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
        ],
      ),
    );
  }
}
