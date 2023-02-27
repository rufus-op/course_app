// ignore_for_file: prefer_const_constructors
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class CoursesListView extends StatelessWidget {
  CoursesListView({
    required this.categorySection,
    required this.img,
    required this.courseTitle,
    required this.instructorName,
    required this.rating,
    required this.studentsEnrolled,
  });
  String categorySection;
  String img;
  String courseTitle;
  String instructorName;
  String rating;
  String studentsEnrolled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // text will accept (text in place of design written in text e.g. top courses in animation,top courses in development)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            categorySection,
            style: kHeadline,
          ),
        ),
        //create constructor of courses that will accept (image,title,instructorName,ratings,stars,studentsEnrolled)
        SizedBox(
            height: 155,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 130,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Image(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        courseTitle,
                        style: kHeadline,
                      ),
                      Text(
                        instructorName,
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            rating,
                            style: const TextStyle(
                                color: Colors.yellow, fontSize: 11),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12,
                              )
                            ],
                          ),
                          Text(
                            '($studentsEnrolled)',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ))
      ],
    );
  }
}
