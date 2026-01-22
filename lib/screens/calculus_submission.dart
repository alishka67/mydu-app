import 'package:flutter/material.dart';

class CalculusSubmissionScreen extends StatelessWidget {
  const CalculusSubmissionScreen({super.key});

  static const Color bg = Color(0xFF121212);
  static const Color card = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: const Text("Calculus"),
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
                  _RowItem("Submission status", "Submitted for grading"),
                  _RowItem("Grading status", "Graded"),
                  _RowItem(
                    "Time remaining",
                    "Assignment was submitted 3 days 17 hours early",
                  ),
                  _RowItem("Last modified", "24 may 2026, 7:27 AM"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _card(
              title: "File submissions",
              child: Column(
                children: const [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: Text("HW2_Calculus_Saparzhan_Ali.pdf"),
                    subtitle: Text("24 May 2026, 7:27 AM"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _card(
              title: "Feedback",
              child: Column(
                children: const [
                  _RowItem("Grade", "87.50 / 100.00"),
                  _RowItem("Graded on", "Friday, 24 May 2026, 11:43 PM"),
                  _RowItem("Graded by", "Zhangirkhan Khabiyev"),
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

class _RowItem extends StatelessWidget {
  final String left;
  final String right;

  const _RowItem(this.left, this.right);

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