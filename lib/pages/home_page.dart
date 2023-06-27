import 'package:flutter/material.dart';

//Packages Importantes
import 'dart:math';

//Models
import '../models/transaction.dart';

//Components
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../components/chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: 'Padaria',
      value: 40.66,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
    Transaction(
      id: 't1',
      title: 'Cartão de Crédito',
      value: 875.66,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Internet',
      value: 139.90,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Transaction(
      id: 't3',
      title: 'Camisa Nike',
      value: 200.64,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Almoço',
      value: 29.90,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          onSubmit: _addTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransaction: _recentTransactions),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
