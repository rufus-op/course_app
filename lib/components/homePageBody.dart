import 'package:course_app/components/categoriesListView.dart';
import 'package:course_app/components/coursesListView.dart';
import 'package:course_app/components/slideshow.dart';
// import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hire IT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: const [
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 65,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Search',
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
             Slideshow(),
            const CategoriesListView(),
            CoursesListView(
              categorySection: 'Top courses in Design',
              img:
                  'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              courseTitle: 'Learn Basics of\nPhotoshop & illustrator',
              instructorName: 'Abdul Rauf',
              rating: '5',
              studentsEnrolled: '675894',
            ),
            CoursesListView(
              categorySection: 'Top courses in Programming',
              img:
                  'https://media.istockphoto.com/id/1255905201/photo/african-computer-programmer-writing-code.jpg?b=1&s=170667a&w=0&k=20&c=OQLCSGKlWgA8h1iQD1afpPk7WgjBJC9aO6NwRP_pxi0=',
              courseTitle: 'Learn Basics of\nJava & SpringBoot',
              instructorName: 'Abdul Rauf',
              rating: '5',
              studentsEnrolled: '675894',
            ),
          ],
        ),
      ),
    );
  }
}
