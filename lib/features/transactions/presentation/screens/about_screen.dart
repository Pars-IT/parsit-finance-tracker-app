import 'package:flutter/material.dart';

import '../../../../core/constants/company_info.dart';
import '../widgets/brand_footer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
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
                    Center(
                      child: Image.asset(
                        'assets/images/parsit-logo.png',
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Pars IT Finance Tracker',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'A clean offline finance tracker for managing income, expenses, balances, and category-based spending insights.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 18),
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.language_rounded),
                      title: Text('Website'),
                      subtitle: Text(CompanyInfo.website),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.email_outlined),
                      title: Text('Contact'),
                      subtitle: Text(CompanyInfo.email),
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

