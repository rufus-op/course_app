import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Browse Categories',
                style: kHeadline,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'See all',
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                addAutomaticKeepAlives: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 110,
                    child: Column(
                      children: [
                        const Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 8,
                          color: Colors.white,
                          child: Image(
                            image: NetworkImage(
                              'https://img.freepik.com/free-vector/gradient-luxury-background_23-2148999255.jpg?w=740&t=st=1670781299~exp=1670781899~hmac=40bb876b004a7ee8ec95fc8a93940a02a467eacf3d5501fb476960eabb43b149',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('Category $index'),
                      ],
                    ),
                  );
                })),
      ],
    );
  }
}
