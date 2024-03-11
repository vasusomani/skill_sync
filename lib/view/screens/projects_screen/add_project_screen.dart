import 'package:flutter/material.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/constants/data.dart';
import 'package:skill_sync/view/components/custom_buttons.dart';
import 'package:skill_sync/view/components/textfields/custom_dropdown.dart';
import 'package:skill_sync/view/components/textfields/primary_textfields.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController subDomainController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  List<String> subDomainsList =
      ConstantData().subDomainLists.values.expand((e) => e).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Project'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                PrimaryTextField(
                    controller: projectTitleController,
                    hintText: "Enter Project Title",
                    label: "Project Title"),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextField(
                    controller: projectDescriptionController,
                    hintText: "Enter Project Description",
                    maxLines: 5,
                    maxLength: 500,
                    label: "Project Description"),
                const SizedBox(
                  height: 30,
                ),
                CustomDropDown(
                    items: ConstantData().domainList,
                    label: "Project Domain",
                    hintText: "Select Project Domain",
                    controller: domainController,
                    setState: () {
                      setState(() {});
                    },
                    enableSearch: true),
                const SizedBox(
                  height: 30,
                ),
                CustomDropDown(
                    items: (domainController.text == "null" ||
                            domainController.text == "")
                        ? subDomainsList
                        : ConstantData().subDomainLists[domainController.text]!,
                    label: "Project Sub Domain",
                    hintText: "Select Project Sub Domain",
                    controller: subDomainController,
                    enableSearch: true),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextField(
                    controller: durationController,
                    hintText: "Enter Project Duration",
                    label: "Project Duration (in days)"),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextField(
                    controller: startDateController,
                    prefixIcon: Icon(
                      Icons.edit_calendar_rounded,
                      color: CustomColors.secondaryColor1,
                    ),
                    hintText: startDateController.text.isEmpty
                        ? "Select Start Date"
                        : startDateController.text,
                    isDateTime: true,
                    label: "Start Date"),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextField(
                    controller: skillsController,
                    hintText: "Enter skills required separated by comma",
                    label: "Skills Required"),
                SizedBox(
                  height: 50,
                ),
                PrimaryButton(title: "Submit", onPressed: () {}),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
