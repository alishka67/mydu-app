import 'package:flutter/material.dart';
import '../db/app_db.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color bg = Color(0xFF121212);

  Future<List<Map<String, Object?>>> _loadLogins() {
    return AppDb.instance.getLastLogins(limit: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: bg,
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
            const SizedBox(height: 16),
            _sqliteCard(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Color(0xFF2A2A2A),
          child: Icon(Icons.person, size: 64, color: Colors.grey),
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
        Text("ST-2504", style: TextStyle(color: Colors.grey)),
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
      child: const Column(
        children: [
          _InfoRow(
              icon: Icons.email,
              label: "Email",
              value: "251608@astanait.edu.kz"),
          _InfoRow(icon: Icons.badge, label: "IIN", value: "080406551138"),
          _InfoRow(
              icon: Icons.cake, label: "Birthdate", value: "6 April 2008"),
          _InfoRow(icon: Icons.school, label: "Course", value: "1"),
          _InfoRow(icon: Icons.person_outline, label: "Status", value: "Студент"),
          _InfoRow(
              icon: Icons.book,
              label: "Studying status",
              value: "Обучающийся"),
          _InfoRow(
              icon: Icons.account_balance_wallet,
              label: "Financing",
              value: "Грант"),
          _InfoRow(
              icon: Icons.phone, label: "Phone", value: "+7 (747) 276-84-56"),
          _InfoRow(
              icon: Icons.swap_horiz,
              label: "Academic mobility",
              value: "No"),
          _InfoRow(icon: Icons.exit_to_app, label: "Retire", value: "No"),
        ],
      ),
    );
  }

  Widget _sqliteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Last logins (SQLite)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          FutureBuilder<List<Map<String, Object?>>>(
            future: _loadLogins(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text(
                  "Loading...",
                  style: TextStyle(color: Colors.grey),
                );
              }

              if (snapshot.hasError) {
                return Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.redAccent),
                );
              }

              final data = snapshot.data ?? [];
              if (data.isEmpty) {
                return const Text(
                  "No logins yet",
                  style: TextStyle(color: Colors.grey),
                );
              }

              return Column(
                children: data.map((row) {
                  final email = (row['email'] ?? '').toString();
                  final lastLogin = (row['last_login'] ?? '').toString();

                  String pretty = lastLogin;
                  if (pretty.length >= 16) {
                    pretty = pretty.substring(0, 16).replaceAll('T', ' ');
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            email,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          pretty,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    await AppDb.instance.addTestLogin();
                    if (!mounted) return;
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add test login"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    await AppDb.instance.clearUsers();
                    if (!mounted) return;
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text("Clear"),
                ),
              ),
            ],
          ),
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