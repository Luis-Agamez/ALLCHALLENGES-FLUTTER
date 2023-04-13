class Transaction {
  final String cardNumber;
  final String sendNumber;
  final double amount;
  final String imgReference;
  final String time;
  final String description;

  Transaction(
      {required this.cardNumber,
      required this.sendNumber,
      required this.amount,
      required this.imgReference,
      required this.time,
      required this.description});
}
