import 'package:flutter/material.dart';

import '../../../domain/models/bank_accounts.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key? key,
    required this.account,
  }) : super(key: key);

  final BankAccount account;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = Color(account.rawForegroundColor);

    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage(account.imageBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                account.bankLogo,
                width: 60,
                color: foregroundColor,
              ),
              Text(
                '',
                style: TextStyle(
                  fontSize: 24,
                  color: foregroundColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const Spacer(),
          const Text(
            '',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF081A38),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
