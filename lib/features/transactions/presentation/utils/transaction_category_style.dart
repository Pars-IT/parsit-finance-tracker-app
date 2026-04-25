import 'package:flutter/material.dart';

import '../../domain/entities/finance_transaction.dart';

class TransactionCategoryStyle {
  const TransactionCategoryStyle({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;
}

extension TransactionCategoryStyleX on TransactionCategory {
  TransactionCategoryStyle get style => switch (this) {
        TransactionCategory.salary => const TransactionCategoryStyle(
            icon: Icons.account_balance_wallet_rounded,
            color: Color(0xFF0F766E),
          ),
        TransactionCategory.freelance => const TransactionCategoryStyle(
            icon: Icons.laptop_mac_rounded,
            color: Color(0xFF2563EB),
          ),
        TransactionCategory.food => const TransactionCategoryStyle(
            icon: Icons.restaurant_rounded,
            color: Color(0xFFEA580C),
          ),
        TransactionCategory.transport => const TransactionCategoryStyle(
            icon: Icons.directions_bus_rounded,
            color: Color(0xFF0891B2),
          ),
        TransactionCategory.shopping => const TransactionCategoryStyle(
            icon: Icons.shopping_bag_rounded,
            color: Color(0xFFC026D3),
          ),
        TransactionCategory.bills => const TransactionCategoryStyle(
            icon: Icons.receipt_long_rounded,
            color: Color(0xFFDC2626),
          ),
        TransactionCategory.entertainment => const TransactionCategoryStyle(
            icon: Icons.movie_creation_rounded,
            color: Color(0xFF7C3AED),
          ),
        TransactionCategory.health => const TransactionCategoryStyle(
            icon: Icons.favorite_rounded,
            color: Color(0xFFE11D48),
          ),
        TransactionCategory.education => const TransactionCategoryStyle(
            icon: Icons.school_rounded,
            color: Color(0xFF4F46E5),
          ),
        TransactionCategory.travel => const TransactionCategoryStyle(
            icon: Icons.flight_takeoff_rounded,
            color: Color(0xFF0284C7),
          ),
        TransactionCategory.investment => const TransactionCategoryStyle(
            icon: Icons.trending_up_rounded,
            color: Color(0xFF65A30D),
          ),
        TransactionCategory.gift => const TransactionCategoryStyle(
            icon: Icons.card_giftcard_rounded,
            color: Color(0xFFDB2777),
          ),
        TransactionCategory.other => const TransactionCategoryStyle(
            icon: Icons.category_rounded,
            color: Color(0xFF6B7280),
          ),
      };
}

