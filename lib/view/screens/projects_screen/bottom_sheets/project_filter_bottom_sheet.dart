import 'package:flutter/material.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/constants/data.dart';
import 'package:skill_sync/view/components/textfields/custom_dropdown.dart';

import '../../../components/custom_buttons.dart';

void projectFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: CustomColors.backgroundColor,
    context: context,
    builder: (context) {
      TextEditingController domainController = TextEditingController();
      TextEditingController subDomainController = TextEditingController();
      List<String> subDomainsList =
          ConstantData().subDomainLists.values.expand((e) => e).toList();
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDropDown(
                items: ConstantData().domainList,
                label: "Project Domain",
                hintText: "Select Project Domain",
                controller: domainController,
                enableSearch: true),
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
            ),
            //sort dropdown
            CustomDropDown(
                items: ConstantData().sortList,
                label: "Sort By",
                hintText: "Sort projects by",
                controller: subDomainController),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(
                  title: "Clear Filters",
                  onPressed: () {
                    domainController.clear();
                    subDomainController.clear();
                  },
                ),
                SecondaryButton(
                  title: "Apply Filters",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
