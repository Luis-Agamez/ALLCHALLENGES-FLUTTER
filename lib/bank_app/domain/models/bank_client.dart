import 'bank_accounts.dart';

class BankClient {
  final String name;
  final String pathImage;
  final List<BankAccount> accounts;

  BankClient(this.name, this.pathImage, this.accounts);

  static List<BankClient> get users => [
        BankClient('Francis Garcia', 'assets/bankImg/bill.jpg', []),
        BankClient('Arthur Li', 'assets/bankImg/elon.jpg', []),
        BankClient('Christian Lake', 'assets/bankImg/mark.jpg', []),
        BankClient('Liam Smith', 'assets/bankImg/photo1.jpg', []),
      ];
}
