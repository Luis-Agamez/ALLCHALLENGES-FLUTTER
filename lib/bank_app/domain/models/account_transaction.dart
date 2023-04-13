class AccountTransaction {
  const AccountTransaction(
    this.header,
    this.concept,
    this.money,
    this.srcImage,
  );

  final String header;
  final String concept;
  final double money;
  final String srcImage;
}
