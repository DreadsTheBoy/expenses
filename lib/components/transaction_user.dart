import 'dart:math';

import 'package:flutter/material.dart';

//Models
import '../models/transaction.dart';

//Components
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Conta #1',
      value: 875.66,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #2',
      value: 139.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta #3',
      value: 602.8,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta #4',
      value: 100.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta #5',
      value: 750.48,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta #6',
      value: 129.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Conta #7',
      value: 139.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'Conta #8',
      value: 139.90,
      date: DateTime.now(),
    )
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(onSubmit: _addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
