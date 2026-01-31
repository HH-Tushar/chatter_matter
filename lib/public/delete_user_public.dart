import 'package:flutter/material.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Delete Account – Chatter Matters',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              Text(
                'If you would like to request deletion of your account and associated data '
                'from Chatter Matters, please follow the instructions below.',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 24),

              Text(
                'How to request account deletion',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),

              BulletPoint(text: 'Open the Chatter Matters mobile application'),
              BulletPoint(text: 'Go to Settings → Delete Account'),
              BulletPoint(text: 'Submit the deletion request with a reason'),

              SizedBox(height: 24),

              Text(
                'Data deletion policy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),

              BulletPoint(
                text:
                    'Your account profile and personal information will be deleted',
              ),
              BulletPoint(
                text:
                    'Your account will be deactivated immediately after the request',
              ),
              BulletPoint(
                text:
                    'All associated data will be permanently deleted within 30 days',
              ),
              BulletPoint(
                text:
                    'Certain data may be retained if required by law or regulatory obligations',
              ),

              SizedBox(height: 24),

              Text(
                'If you are unable to access the app, please contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                'veenu.aspirations@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 24),

              Text(
                'Last updated: January 2026',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
