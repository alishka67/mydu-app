import 'package:flutter/material.dart';

class DiscreteSubmissionScreen extends StatelessWidget {
  const DiscreteSubmissionScreen({super.key});

  static const Color bg = Color(0xFF121212);
  static const Color card = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: const Text("Discrete Mathematics"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _card(
              title: "Submission status",
              child: Column(
                children: const [
                  _row("Submission status", "Submitted for grading"),
                  _row("Grading status", "Graded"),
                  _row(
                    "Time remaining",
                    "Assignment was submitted 9 days 4 hours early",
                  ),
                  _row("Last modified", "22 May 2026, 4:32 PM"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _card(
              title: "File submissions",
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: const Text("HW2_Discrete_Saparzhan_Ali.pdf"),
                    subtitle: const Text("22 May 2026, 4:32 PM"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _card(
              title: "Feedback",
              child: Column(
                children: const [
                  _row("Grade", "100.00 / 100.00"),
                  _row("Graded on", "Friday, 23 May 2026, 5:37 PM"),
                  _row("Graded by", "Merzetkhan Akerke"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.upload_file),
              label: const Text(
                "Upload file",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _row extends StatelessWidget {
  final String left;
  final String right;

  const _row(this.left, this.right);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: const TextStyle(color: Colors.grey)),
          Flexible(
            child: Text(
              right,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}