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
        itemCount: providerCarrinho.carrinhoListaProdutos.length,
        itemBuilder: (context, index) {
          CarrinhoProdutoModel item =
              providerCarrinho.carrinhoListaProdutos[index];
          String nome = item.nome;
          double quantidade = item.quantidade;
          double precoQuantidade = item.precoQuantidade;
          String quantidadePreco = "$quantidade - $precoQuantidade";

          return Column(
            children: [
              ListTile(
                title: Text(nome),
                subtitle: Text(quantidadePreco),
              ),
              Consumer<CarrinhoProvider>(
                builder: (context, carrinhoProviderConsumer, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          carrinhoProviderConsumer.adicionaQuantidade(
                              item.id, 1);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          carrinhoProviderConsumer.removerQuantidade(
                              item.id, 1);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () {
                          carrinhoProviderConsumer.removerProduto(item.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  );
                },
              ),
              const Divider(color: Colors.black),
            ],
          );
        },
      ),
    );
  }
}
