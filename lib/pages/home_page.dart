import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/produto_model.dart';
import 'package:app_ecommerce/utils/listas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("HomePage"),
      ),
      body: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          ProdutoModel item = listaProdutos[index];
          var nome = item.nome;
          var preco =
              "R\$ ${item.preco.toStringAsFixed(2).replaceAll(".", ",")}";
          return ListTile(
            title: Text(nome),
            subtitle: Text(preco),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 32),
            ),
          );
        },
      ),
    );
  }
}
