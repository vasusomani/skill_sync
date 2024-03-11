import 'package:flutter/material.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/models/project_model.dart';
import 'package:skill_sync/models/user_model.dart';
import 'package:skill_sync/view/components/custom_buttons.dart';
import 'package:skill_sync/view/components/textfields/primary_textfields.dart';

void requestProjectModelSheet(
    {required BuildContext context,
    required ProjectModel projectModel,
    required UserModel user}) {
  showModalBottomSheet(
    backgroundColor: CustomColors.backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      minHeight: MediaQuery.of(context).size.height * 0.5,
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Request Collaboration',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    projectModel.title!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryTextField(
                    controller: TextEditingController(),
                    hintText:
                        "Design a custom message to increase the chances of collaboration...",
                    maxLines: 8,
                    hintStyle: TextStyle(color: CustomColors.secondaryColor1),
                    maxLength: 500,
                    label: 'Message',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: PrimaryButton(
                          title: "Send",
                          onPressed: () => Navigator.pop(context),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
