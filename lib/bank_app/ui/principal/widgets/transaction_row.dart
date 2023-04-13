import 'package:flutter/material.dart';

import '../../../domain/models/account_transaction.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final AccountTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              transaction.srcImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                transaction.header,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                transaction.concept,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Text(
          '\$${transaction.money}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
