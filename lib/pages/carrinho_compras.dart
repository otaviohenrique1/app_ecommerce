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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Consumer<CarrinhoProvider>(
        builder: (context, carrinhoProviderConsumer, child) {
          return Column(
            children: [
              const SizedBox(height: 16),
              Text(
                "Total: R\$ ${carrinhoProviderConsumer.calculaValorTotal().toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      carrinhoProviderConsumer.carrinhoListaProdutos.length,
                  itemBuilder: (context, index) {
                    CarrinhoProdutoModel item =
                        carrinhoProviderConsumer.carrinhoListaProdutos[index];
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
                        Row(
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
                                carrinhoProviderConsumer
                                    .removerProduto(item.id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Finalizar"),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        carrinhoProviderConsumer.limparLista();
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
