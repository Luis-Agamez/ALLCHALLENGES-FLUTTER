import 'account_transaction.dart';

class BankAccount {
  final int numberCard;
  final int rawForegroundColor;
  final double balance;
  final String bankName;
  final String bankLogo;
  final String imageBackground;
  final AccountTransaction lastTransaction;

  BankAccount(
      {required this.numberCard,
      required this.rawForegroundColor,
      required this.balance,
      required this.bankName,
      required this.bankLogo,
      required this.imageBackground,
      required this.lastTransaction});
}
