import 'package:flutter/material.dart';

class SubmissionScreen extends StatelessWidget {
  final String subject;

  const SubmissionScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: Text(subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Submission status",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _row("Submission status", "Submitted for grading"),
            _row("Grading status", "Graded"),
            _row("Time remaining", "Submitted early"),
            _row("Last modified", "24 May 2026, 7:27 PM"),

            const SizedBox(height: 16),
            const Divider(),

            const SizedBox(height: 16),
            const Text(
              "File submissions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            ListTile(
              leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
              title: const Text("HW2_Saparzhan_Ali.pdf"),
              subtitle: const Text("24 May 2026, 7:27 PM"),
            ),

            const Spacer(),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(48),
              ),
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload file"),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: const TextStyle(color: Colors.grey)),
          Text(right),
        ],
      ),
    );
  }
}