import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedDay = 0;

  final days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  final Map<int, List<Lesson>> schedule = {
    0: [
      Lesson(
        time: "08:00 – 08:50",
        name: "Cultural Studies",
        type: "Practice",
        room: "C1.1.233P",
        teacher: "Torgyn Kaidarova",
      ),
      Lesson(
        time: "10:00 – 10:50",
        name: "Introduction to Electrodynamics",
        type: "Lecture",
        room: "C1.2.251L",
        teacher: "Mukhmetov Olzhas",
      ),
      Lesson(
        time: "11:00 – 11:50",
        name: "Discrete Mathematics",
        type: "Practice",
        room: "C1.3.331P",
        teacher: "Merzekhan Akerke",
      ),
      Lesson(
        time: "12:00 – 12:50",
        name: "Discrete Mathematics",
        type: "Practice",
        room: "C1.3.331P",
        teacher: "Merzekhan Akerke",
      ),
    ],
    1: [
      Lesson(
        time: "10:00 – 10:50",
        name: "Calculus 2",
        type: "Lecture",
        room: "C1.1.328L",
        teacher: "Zhuldassov Zhanat",
      ),
      Lesson(
        time: "11:00 – 11:50",
        name: "Calculus 2",
        type: "Lecture",
        room: "C1.1.328L",
        teacher: "Zhuldassov Zhanat",
      ),
      Lesson(
        time: "12:00 – 12:50",
        name: "Calculus 2",
        type: "Practice",
        room: "C1.3.232P",
        teacher: "Khabiyev Zhangirkhan",
      ),
      Lesson(
        time: "13:00 – 13:50",
        name: "Calculus 2",
        type: "Practice",
        room: "C1.3.232P",
        teacher: "Khabiyev Zhangirkhan",
      ),
    ],
    2: [
      Lesson(
        time: "08:00 – 08:50",
        name: "Discrete Mathematics",
        type: "Lecture",
        room: "C1.2.237L",
        teacher: "Jankiyeva Botagoz",
      ),
      Lesson(
        time: "09:00 – 09:50",
        name: "Discrete Mathematics",
        type: "Lecture",
        room: "C1.2.237L",
        teacher: "Jankiyeva Botagoz",
      ),
      Lesson(
        time: "10:00 – 10:50",
        name: "Introduction to Electrodynamics",
        type: "Practice",
        room: "C1.3.124 (Control Eng. Lab)",
        teacher: "Mukhmetov Olzhas",
      ),
      Lesson(
        time: "11:00 – 11:50",
        name: "Introduction to Electrodynamics",
        type: "Practice",
        room: "C1.3.124 (Control Eng. Lab)",
        teacher: "Mukhmetov Olzhas",
      ),
    ],
    3: [
      Lesson(
        time: "09:00 – 09:50",
        name: "Introduction to Electrodynamics",
        type: "Lecture",
        room: "C1.2.251L",
        teacher: "Mukhmetov Olzhas",
      ),
      Lesson(
        time: "10:00 – 10:50",
        name: "Introduction to Electrodynamics",
        type: "Lecture",
        room: "C1.2.251L",
        teacher: "Mukhmetov Olzhas",
      ),
    ],
    4: [
      Lesson(
        time: "10:00 – 10:50",
        name: "Foreign Language 2",
        type: "Practice",
        room: "C1.2.226P",
        teacher: "Ishanova Ayelita",
      ),
      Lesson(
        time: "11:00 – 11:50",
        name: "Foreign Language 2",
        type: "Practice",
        room: "C1.2.226P",
        teacher: "Ishanova Ayelita",
      ),
    ],
    5: [
      Lesson(
        time: "11:00 – 11:50",
        name: "Object-Oriented Programming",
        type: "Practice",
        room: "C1.1.361K",
        teacher: "Imran Khaider",
      ),
            Lesson(
        time: "12:00 – 12:50",
        name: "Object-Oriented Programming",
        type: "Practice",
        room: "C1.1.361K",
        teacher: "Imran Khaider",
      ),
            Lesson(
        time: "13:00 – 13:50",
        name: "Object-Oriented Programming",
        type: "Practice",
        room: "C1.1.361K",
        teacher: "Imran Khaider",
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text("Schedule"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _daySelector(),
          const SizedBox(height: 12),
          Expanded(child: _lessons()),
        ],
      ),
    );
  }

  Widget _daySelector() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final active = selectedDay == i;
          return GestureDetector(
            onTap: () => setState(() => selectedDay = i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? Colors.blue : const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                days[i],
                style: TextStyle(
                  color: active ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _lessons() {
    final lessons = schedule[selectedDay] ?? [];

    if (lessons.isEmpty) {
      return const Center(
        child: Text(
          "No classes",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: lessons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (_, i) => _lessonCard(lessons[i]),
    );
  }

  Widget _lessonCard(Lesson l) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text("Type: ${l.type}", style: _sub),
          Text("Classroom: ${l.room}", style: _sub),
          Text("Lecturer: ${l.teacher}", style: _sub),
        ],
      ),
    );
  }

  static const _sub = TextStyle(color: Colors.grey);
}

class Lesson {
  final String time;
  final String name;
  final String type;
  final String room;
  final String teacher;

  Lesson({
    required this.time,
    required this.name,
    required this.type,
    required this.room,
    required this.teacher,
  });
}