import 'package:flutter/material.dart';

import '../../../domain/models/transaction.dart';

class CardTrasaction extends StatelessWidget {
  const CardTrasaction({super.key, required this.transaction});
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.indigo),
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(transaction.imgReference),
                  )),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    transaction.description,
                    style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 16,
                        fontFamily: 'PMedium'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    transaction.time,
                    style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 14,
                        fontFamily: 'PRegular'),
                  )
                ],
              ),
            ],
          ),
          Text(
            '-\$${transaction.amount}',
            style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 24,
                fontFamily: 'PMedium'),
          ),
        ],
      ),
    );
  }
}
