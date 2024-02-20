import 'package:flutter/material.dart';
import 'package:fundraising_fullstack/home/models/projects.dart';

class CaseCard extends StatelessWidget {
  const CaseCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 20),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: project.imgurl,
                  child: Image.asset(
                    project.imgurl,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.error)),
                    Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                    Text(
                      'Raised so far',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$ ${project.donation}',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Expanded(
                      child: Slider(
                        min: 0.0,
                        max: 100.0,
                        value: 60.0,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
