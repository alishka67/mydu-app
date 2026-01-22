import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const Color bg = Color(0xFF121212);
  static const Color text = Color.fromARGB(255, 255, 255, 255);
  static const Color icon = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            _section("Menu"),
            _item(Icons.people_outline, "Academic staff"),
            _item(Icons.description_outlined, "Transcript"),
            _item(Icons.receipt_long_outlined, "Reception"),
            _item(Icons.account_balance_outlined, "Deans Office"),
            _item(Icons.assignment_turned_in_outlined, "Course Enrollment"),
            _item(Icons.school_outlined, "Curriculum"),
            _item(Icons.psychology_outlined, "Psychologist Appointment"),
            _item(Icons.check_circle_outline, "Approve Curriculum"),
            _item(Icons.verified_user_outlined, "Confirm Personal Info"),
            _item(Icons.language_outlined, "iROS"),
            _item(Icons.groups_outlined, "SSCI"),
            _item(Icons.sports_outlined, "Physical Education"),
            _item(Icons.edit_document, "FX Exam Application"),
            _item(Icons.restart_alt, "Retake Application"),
            _item(Icons.folder_open_outlined, "Applications"),
            _item(Icons.flight_takeoff_outlined, "Academic Mobility"),
            _item(Icons.workspace_premium_outlined, "Diploma"),

            const SizedBox(height: 24),
            _section("Contacts"),

            _contact(
              title: "DU Tech Support",
              subtitle: "technical questions about du, moodle, abitur",
              email: "support_du@astanait.edu.kz",
            ),
            _contact(
              title: "Tech Support",
              subtitle: "other technical questions",
              email: "helpdesk@astanait.edu.kz",
            ),
            _contact(
              title: "Military department",
              email: "alexei.peresipkin@astanait.edu.kz",
              phone: "+7 (701) 412-87-58",
              room: "C1.3.336",
            ),
            _contact(
              title: "Request for Transcript",
              email: "transcript@astanait.edu.kz",
            ),
            _contact(
              title: "Медпункт",
              phone: "8 (7172) 64-57-33",
            ),
            _contact(
              title:
                  "Department of the students' affairs (Clubs, Volunteers, Dormitory, Lockers)",
              email: "arman.kenzhebekov@astanait.edu.kz",
              room: "C1.1.323",
            ),
            _contact(
              title:
                  "Change password (Moodle, Microsoft products), SEB configurations",
              email: "helpdesk@astanait.edu.kz",
              room: "C1.2.255",
            ),
            _contact(
              title: "Head of the Registrar's office (FX, Retake, Schedule)",
              email: "office.reg@astanait.edu.kz",
              room: "C1.1.270",
            ),
            _contact(
              title: "Head of the Students Department",
              email: "g.zhussupova@astanait.edu.kz",
              room: "C1.1.273",
            ),
            _contact(
              title: "Deans office",
              email: "deans_office@astanait.edu.kz",
              room: "C1.1.320",
            ),
            _contact(
              title:
                  "Muslim Sergaziyev – Department of Computational and Data Science",
              room: "C1.1.321",
            ),
            _contact(
              title: "Praveen Kumar – Computer Engineering Department",
              room: "C1.3.359",
            ),
            _contact(
              title:
                  "Zhibek Tleshova – Department of General Educational Disciplines",
              room: "C1.1.263",
            ),
            _contact(
              title:
                  "Leila Rzayeva – Department of Intelligent Systems and Cybersecurity",
              room: "C1.1.330",
            ),
            _contact(
              title: "Ha Jin Hwang – School of Creative Industries",
              room: "C1.3.353",
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _item(IconData iconData, String textLabel) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(iconData, color: icon),
      title: Text(
        textLabel,
        style: const TextStyle(color: text, fontSize: 15),
      ),
      onTap: () {},
    );
  }

  Widget _contact({
    required String title,
    String? subtitle,
    String? email,
    String? phone,
    String? room,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          if (subtitle != null)
            Text(subtitle, style: const TextStyle(color: text)),
          if (email != null)
            Text("Mail: $email", style: const TextStyle(color: Colors.blue)),
          if (phone != null)
            Text("Phone: $phone", style: const TextStyle(color: text)),
          if (room != null)
            Text("Room: $room", style: const TextStyle(color: text)),
        ],
      ),
    );
  }
}