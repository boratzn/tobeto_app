import 'package:flutter/material.dart';
import 'package:tobeto_app/models/skill.dart';
import 'package:tobeto_app/widgets/profile_screen/skills_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    this.skillList,
  });

  final List<Skill>? skillList;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yetkinliklerim",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            skillList != null
                ? SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: skillList!.length,
                      itemBuilder: (context, index) {
                        var item = skillList![index];
                        return SkillsWidget(
                          title: item.skillName ?? "",
                        );
                      },
                    ),
                  )
                : const SizedBox(
                    height: 15,
                  ),
          ],
        ),
      ),
    );
  }
}
