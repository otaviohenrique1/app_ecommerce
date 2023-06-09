import 'package:app_ecommerce/providers/carrinho_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_ecommerce/utils/listas.dart';

import '../models/carrinho_produto_model.dart';

class CarrinhoCompras extends StatefulWidget {
  const CarrinhoCompras({super.key});

  @override
  State<CarrinhoCompras> createState() => _CarrinhoComprasState();
}

class _CarrinhoComprasState extends State<CarrinhoCompras> {
  @override
  Widget build(BuildContext context) {
    CarrinhoProvider providerCarrinho =
        Provider.of<CarrinhoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          CarrinhoProdutoModel item =
              providerCarrinho.carrinhoListaProdutos[index];
          String nome = item.nome;
          double quantidade = item.quantidade;
          double precoQuantidade = item.precoQuantidade;
          String quantidadePreco = "$quantidade - $precoQuantidade";

          return ListTile(
            title: Text(nome),
            subtitle: Text(quantidadePreco),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, size: 32),
            ),
          );
        },
      ),
    );
  }
}
