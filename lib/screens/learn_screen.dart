import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
      backgroundColor: const Color(0xFF121212),
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: const Color(0xFF121212),
      title: const Text(
        "Catalog of Courses",
        style: TextStyle(color: Colors.white),
      ),
    ),
  body: Padding(
    padding: const EdgeInsets.all(16),
    child: GridView.builder(
      itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}

class Course {
  final String code;
  final String title;
  final String date;
  final String image; 

  Course({
    required this.code,
    required this.title,
    required this.date,
    required this.image,
  });
}


final List<Course> courses = [
  Course(
    code: "VR01",
    title: "Введение в иммерсивные технологии",
    date: "5 июня 2021",
    image: "assets/images/courses/vr01.png",
  ),
  Course(
    code: "FSPR_01",
    title: "Основы научно-педагогических исследований",
    date: "1 окт. 2025",
    image: "assets/images/courses/fspr_01.png",
  ),
  Course(
    code: "ISF_01",
    title: "Information Security Fundamentals",
    date: "1 нояб. 2025",
    image: "assets/images/courses/isf_01.png",
  ),
  Course(
    code: "I2C_01",
    title: "Introduction to Cybersecurity",
    date: "2 нояб. 2025",
    image: "assets/images/courses/i2c_01.png",
  ),
  Course(
    code: "KazT_01",
    title: "Қазақ тілі",
    date: "10 сент. 2025",
    image: "assets/images/courses/kazt_01.png",
  ),
  Course(
    code: "AcadWrit_01",
    title: "Academic Writing",
    date: "15 сент. 2025",
    image: "assets/images/courses/acadwrit_01.png",
  ),
];

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(course.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.code,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Начало курса: ${course.date}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}