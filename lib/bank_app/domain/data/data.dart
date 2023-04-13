import 'package:app_one/bank_app/ui/constant.dart';
import 'package:flutter/material.dart';

import '../models/account_transaction.dart';
import '../models/bank_accounts.dart';
import '../models/card.dart';
import '../models/contacts.dart';
import '../models/transaction.dart';

List<CardData> cards = [
  CardData(
      bankName: 'BANCO DE BOGOTA',
      numberCard: '1003360363',
      current: 7429733,
      logo: 'assets/bankImg/visa_1.png',
      img: 'assets/bankImg/bbva.png',
      color: Colors.blue),
  CardData(
      bankName: 'BANCOLOMBIA',
      numberCard: '1003493345',
      current: 7429733,
      logo: 'assets/bankImg/card.png',
      img: 'assets/bankImg/bancolombia.png',
      color: secondColor),
  CardData(
      bankName: 'BBVA',
      numberCard: '1003321331',
      current: 7429733,
      logo: 'assets/bankImg/visa_1.png',
      img: 'assets/bankImg/bbva.png',
      color: primaryColor),

  /* CardData(
      bankName: 'COLPATRIA',
      numberCard: '1003234542',
      current: 7429733,
      logo: 'assets/bankImg/card.png',
      img: 'assets/bankImg/bancolombia.png',
      color: const Color(0xFFfdda24)),*/
];

List<Contact> contacts = [
  Contact(
      img: 'assets/elon.jpg',
      name: 'Elonk Musk',
      email: 'elonMusk@gmail.com',
      address: 'Calle 24 crr 34 18-91'),
  Contact(
      img: 'assets/mark.jpg',
      name: 'Mark Zuckerberg',
      email: 'markz@gmail.com',
      address: 'Calle 24 crr 34 18-91'),
  Contact(
      img: 'assets/bill.jpg',
      name: 'Bill Gates',
      email: 'billgates@gmail.com',
      address: 'Calle 24 crr 34 18-91'),
];

List<Transaction> transactions = [
  Transaction(
      cardNumber: '1003360363',
      sendNumber: '1003321331',
      amount: 78.434,
      imgReference: 'assets/bankImg/netflix.jpg',
      time: '7:34 PM ',
      description: 'Netflix'),
  Transaction(
      cardNumber: '1003360363',
      sendNumber: '1003321331',
      amount: 789846.434,
      imgReference: 'assets/bankImg/elon.jpg',
      time: '1:34 AM',
      description: 'Elon Pay'),
  Transaction(
      cardNumber: '1003360363',
      sendNumber: '1003321331',
      amount: 78.434,
      imgReference: 'assets/bankImg/bill.jpg',
      time: '8:34 AM',
      description: 'Bill Pay')
];

List<BankAccount> accountCards = [
  BankAccount(
      balance: 10230,
      numberCard: 9002,
      rawForegroundColor: 0x400040FF,
      bankName: 'BBVA Bancomer',
      bankLogo: 'assets/bankImg/bbva-logo.png',
      imageBackground: 'assets/bankImg/bbva-background.jpg',
      lastTransaction: const AccountTransaction('Next 30 July', 'HBO Max',
          -14.99, 'assets/bankImg/hbo-max-logo.webp')),
  BankAccount(
      balance: 10230,
      numberCard: 9002,
      rawForegroundColor: 0x400040FF,
      bankName: 'Citi',
      bankLogo: 'assets/bankImg/citi-logo.png',
      imageBackground: 'assets/bankImg/citi-background.jpg',
      lastTransaction: const AccountTransaction('Next 06 August', 'Netflix',
          -12.99, 'assets/bankImg/netflix-logo.jpg')),
  BankAccount(
      balance: 10230,
      numberCard: 9002,
      rawForegroundColor: 0x400040FF,
      bankName: 'Santander',
      bankLogo: 'assets/bankImg/san-logo.png',
      imageBackground: 'assets/bankImg/santander-background.jpg',
      lastTransaction: const AccountTransaction('Next 06 August', 'Netflix',
          -12.99, 'assets/bankImg/save-money.jpg')),
];
