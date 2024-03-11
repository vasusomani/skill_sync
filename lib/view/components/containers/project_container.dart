import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/models/project_model.dart';
import 'package:skill_sync/services/state_management_services/user_provider.dart';
import 'package:skill_sync/view/components/custom_buttons.dart';

import '../../../models/user_model.dart';
import '../../screens/projects_screen/bottom_sheets/request_project_bottom_sheet.dart';

class ProjectContainer extends ConsumerStatefulWidget {
  const ProjectContainer(
      {super.key,
      required this.project,
      this.isOngoing = false,
      this.isRequested = false,
      this.isCollaborated = false});
  final ProjectModel project;
  final bool isOngoing;
  final bool isRequested;
  final bool isCollaborated;

  @override
  ConsumerState<ProjectContainer> createState() => _ProjectContainerState();
}

class _ProjectContainerState extends ConsumerState<ProjectContainer> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    UserModel? user = ref.read(userProvider);
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        constraints: const BoxConstraints(
          minHeight: 100,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: CustomColors.backgroundColor,
          border: Border.all(
            color: CustomColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.project.title!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: CustomColors.primaryColor,
                      ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.project.domain!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: CustomColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(
              widget.project.description!,
              maxLines: isExpanded ? 10 : 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: CustomColors.secondaryColor1),
            ),
            const SizedBox(height: 10),
            if (isExpanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.project.subDomain!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: CustomColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: widget.project.skills!
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CustomColors.secondaryColor1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              e,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: CustomColors.secondaryColor1,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //duration
                Text(
                  '${widget.project.duration} days',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: CustomColors.secondaryColor1,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                //deadline
                Text(
                  DateFormat('dd MMMM').format(widget.project.startDate!),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: CustomColors.secondaryColor1,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            if (isExpanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  if (widget.isOngoing)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondaryButton(
                              title: "Delete Project", onPressed: () {}),
                          const SizedBox(width: 20),
                          SecondaryButton(
                              title: "Collaborated",
                              onPressed: () => requestProjectModelSheet(
                                  context: context,
                                  projectModel: widget.project,
                                  user: user!)),
                        ],
                      ),
                    ),
                  if (widget.isCollaborated)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondaryButton(
                              title: "Delete Project", onPressed: () {}),
                          const SizedBox(width: 20),
                          SecondaryButton(
                              title: "Find Collaborator",
                              onPressed: () => requestProjectModelSheet(
                                  context: context,
                                  projectModel: widget.project,
                                  user: user!)),
                        ],
                      ),
                    ),
                  if (widget.isRequested && !widget.project.requestAccepted!)
                    Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryButton(
                                title: "Request Sent", onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  if (widget.isRequested && widget.project.requestAccepted!)
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/chat.svg',
                                height: 20,
                                color: CustomColors.primaryColor,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Chat Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: CustomColors.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (!widget.isOngoing &&
                      !widget.isCollaborated &&
                      !widget.isRequested)
                    Center(
                        child: SecondaryButton(
                            title: "Collaborate",
                            onPressed: () => requestProjectModelSheet(
                                context: context,
                                projectModel: widget.project,
                                user: user!))),
                  const SizedBox(height: 10),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
