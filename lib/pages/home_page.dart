import 'package:flutter/material.dart';

//Components
import 'package:expenses/components/transaction_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            child: Card(
              elevation: 1,
              child: Text('Gráfico'),
            ),
          ),
          TransactionUser()
        ],
      ),
    );
  }
}
