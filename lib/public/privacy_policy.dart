import 'package:flutter/material.dart';

class PrivacyTermsView extends StatelessWidget {
  const PrivacyTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy & Terms'), centerTitle: true),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(width: double.infinity, height: 0),
            SelectableText(
              _legalText,
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

const String _legalText = '''
Privacy Policy for Chatter Matters

Effective Date: January 25, 2026

Chatter Matters we values your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our mobile app available on iOS and Android devices. By using Chatter Matters, you agree to the terms of this Privacy Policy.

1. Information We Collect

We may collect the following types of information:

Personal Information

Name, email.

Usage Data

App activity, features used, crash reports, and analytics data



We do not collect sensitive personal information such as payment card details directly; all payments are processed securely through Stripe or other third-party payment providers.

2. How We Use Your Information

We use the information collected to:

Provide, operate, and maintain the app

Improve, personalize, and optimize the app experience

Communicate with you for support, updates, or notifications

Analyze app usage to improve features and performance

Comply with legal obligations

3. Third-Party Services

We use third-party services that may collect information used to identify you:

Stripe – for secure payment processing

Analytics providers – to monitor app performance

Crash reporting tools – to fix technical issues

We encourage you to review the privacy policies of these services.

4. Data Sharing and Disclosure

We do not sell or trade your personal information. We may share information in limited circumstances:

With service providers that help us operate the app

When required by law, regulation, or legal process

To protect the rights, property, or safety of Chatter Matters, our users, or others

5. Security

We implement appropriate security measures to protect your data. However, no method of transmission over the internet or electronic storage is completely secure. We cannot guarantee absolute security.

6. Your Choices

You can choose not to provide certain information, but this may limit app functionality.

You may request access, correction, or deletion of your personal information by contacting us at [your support email].

7. Account Deletion & Data Deletion

You have the right to request deletion of your account and personal data at any time. Upon request:

Your account will be permanently deleted

Personal information associated with your account will be removed from our systems, except where retention is required by law


8. Changes to This Privacy Policy

We may update this Privacy Policy from time to time. The “Effective Date” at the top will reflect the latest version. Continued use of the app after updates means you accept the changes.

9. Contact Us

If you have any questions about this Privacy Policy, please contact us at:

Email: veenu.aspirations@gmail.com

''';
