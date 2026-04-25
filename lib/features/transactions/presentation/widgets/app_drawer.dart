import 'package:flutter/material.dart';

import '../../../../core/constants/company_info.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.onAddTransaction,
    required this.onViewTransactions,
    required this.onViewChart,
    required this.onViewAbout,
    required this.onViewContact,
  });

  final VoidCallback onAddTransaction;
  final VoidCallback onViewTransactions;
  final VoidCallback onViewChart;
  final VoidCallback onViewAbout;
  final VoidCallback onViewContact;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Image.asset('assets/images/parsit-logo.png'),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pars IT Finance Tracker',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(CompanyInfo.website),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline_rounded),
              title: const Text('Add Transaction'),
              onTap: onAddTransaction,
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long_rounded),
              title: const Text('See Transactions'),
              onTap: onViewTransactions,
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart_rounded),
              title: const Text('Chart'),
              onTap: onViewChart,
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('About'),
              onTap: onViewAbout,
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_outlined),
              title: const Text('Contact'),
              onTap: onViewContact,
            ),
          ],
        ),
      ),
    );
  }
}

