import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 24),
            _infoCard(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 60,
          backgroundColor: Color(0xFF2A2A2A),
          child: Icon(
            Icons.person,
            size: 64,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Сапаржан Әли Әсетұлы",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Ali Saparzhan",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          "ST-2504",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          _InfoRow(icon: Icons.email, label: "Email", value: "251608@astanait.edu.kz"),
          _InfoRow(icon: Icons.badge, label: "IIN", value: "080406551138"),
          _InfoRow(icon: Icons.cake, label: "Birthdate", value: "6 April 2008"),
          _InfoRow(icon: Icons.school, label: "Course", value: "1"),
          _InfoRow(icon: Icons.person_outline, label: "Status", value: "Студент"),
          _InfoRow(icon: Icons.book, label: "Studying status", value: "Обучающийся"),
          _InfoRow(icon: Icons.account_balance_wallet, label: "Financing", value: "Грант"),
          _InfoRow(icon: Icons.phone, label: "Phone", value: "+7 (747) 276-84-56"),
          _InfoRow(icon: Icons.swap_horiz, label: "Academic mobility", value: "No"),
          _InfoRow(icon: Icons.exit_to_app, label: "Retire", value: "No"),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
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