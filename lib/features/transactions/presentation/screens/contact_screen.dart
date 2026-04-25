import 'package:flutter/material.dart';

import '../../../../core/constants/company_info.dart';
import '../widgets/brand_footer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pars IT',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 16),
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.public_rounded),
                      title: Text('Website'),
                      subtitle: Text(CompanyInfo.website),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.mail_outline_rounded),
                      title: Text('Email'),
                      subtitle: Text(CompanyInfo.email),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.verified_user_outlined),
                      title: Text('Copyright'),
                      subtitle: Text(CompanyInfo.copyright),
                    ),
                  ],
                ),
              ),
            ),
            const BrandFooter(),
          ],
        ),
      ),
    );
  }
}

