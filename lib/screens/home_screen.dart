import 'package:flutter/material.dart';
import 'calculus_submission.dart';
import 'discrete_submission.dart';
import 'schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color bg = Color(0xFF121212);
  static const Color card = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 16),
              _banners(),
              const SizedBox(height: 20),
              _deadlines(context),
              const SizedBox(height: 20),
              _schedule(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF1A1A1A),
            backgroundImage:
                const AssetImage('assets/images/avatar/avatar.jpg'),
          ),
          const SizedBox(width: 12),
          const Text(
            "Hello, Ali!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
    );
  }

  Widget _banners() {
    final banners = [
      {
        "title": "How to apply?",
        "image": "assets/images/banners/banner1.jpg",
      },
      {
        "title": "Student Dormitory\nAccommodation",
        "image": "assets/images/banners/banner2.jpg",
      },
      {
        "title": "AITU in 2025?",
        "image": "assets/images/banners/banner3.jpg",
      },
      {
        "title": "How to apply for\na dormitory",
        "image": "assets/images/banners/banner4.jpg",
      },
    ];

    return SizedBox(
      height: 160,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) {
          final item = banners[i];
          return Container(
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                image: AssetImage(item["image"]!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  item["title"]!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _deadlines(BuildContext context) {
    return _card(
      header: const Text(
        "Deadlines",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      child: Column(
        children: [
          _DeadlineItem(
            subject: "Calculus",
            deadline: "May 27, 12:00",
            timeLeft: "3 days, 17 hours remaining",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CalculusSubmissionScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 14),
          _DeadlineItem(
            subject: "Discrete Mathematics",
            deadline: "June 1, 18:00",
            timeLeft: "8 days, 23 hours remaining",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DiscreteSubmissionScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _schedule(BuildContext context) {
    return _card(
      header: Row(
        children: [
          const Expanded(
            child: Text(
              "Schedule for ST-2504",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ScheduleScreen(),
                ),
              );
            },
          ),
        ],
      ),
      child: Column(
        children: const [
          _Lesson(
            time: "10:00 – 10:50",
            name: "Introduction to Electrodynamics",
            type: "Lecture",
            room: "C1.2.251L",
            teacher: "Mukhmetov Olzhas",
          ),
          SizedBox(height: 14),
          Divider(color: Colors.grey),
          SizedBox(height: 14),
          _Lesson(
            time: "11:00 – 11:50",
            name: "Discrete Mathematics",
            type: "Practice",
            room: "C1.3.332P",
            teacher: "Merzekhan Akerke",
          ),
          SizedBox(height: 14),
          Divider(color: Colors.grey),
          SizedBox(height: 14),
          _Lesson(
            time: "12:00 – 12:50",
            name: "Discrete Mathematics",
            type: "Practice",
            room: "C1.3.332P",
            teacher: "Merzekhan Akerke",
          ),
        ],
      ),
    );
  }

  Widget _card({required Widget header, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

class _DeadlineItem extends StatelessWidget {
  final String subject;
  final String deadline;
  final String timeLeft;
  final VoidCallback onTap;

  const _DeadlineItem({
    required this.subject,
    required this.deadline,
    required this.timeLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule, color: Colors.blue),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$subject — $deadline",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                timeLeft,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: Colors.grey),
          onPressed: onTap,
        ),
      ],
    );
  }
}

class _Lesson extends StatelessWidget {
  final String time, name, type, room, teacher;

  const _Lesson({
    required this.time,
    required this.name,
    required this.type,
    required this.room,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text("Type: $type", style: const TextStyle(color: Colors.grey)),
              Text("Classroom: $room",
                  style: const TextStyle(color: Colors.grey)),
              Text("Lecturer: $teacher",
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}