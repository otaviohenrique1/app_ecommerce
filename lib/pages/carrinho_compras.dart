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
    ThemeData theme = Theme.of(context);

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
                style: theme.textTheme.headlineSmall,
              ),
              const Divider(color: Colors.black),
              Expanded(
                child: (carrinhoProviderConsumer.carrinhoListaProdutos.isEmpty)
                    ? Center(
                        child: Text(
                          "Lista vazia",
                          style: theme.textTheme.headlineLarge,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: carrinhoProviderConsumer
                            .carrinhoListaProdutos.length,
                        itemBuilder: (context, index) {
                          CarrinhoProdutoModel item = carrinhoProviderConsumer
                              .carrinhoListaProdutos[index];

                          return _Item(
                            item: item,
                            onPressedAdicionaQuantidade: () {
                              carrinhoProviderConsumer.adicionaQuantidade(
                                  item.id, 1);
                            },
                            onPressedRemoverQuantidade: () {
                              carrinhoProviderConsumer.removerQuantidade(
                                  item.id, 1);
                            },
                            onPressedRemoverProduto: () {
                              carrinhoProviderConsumer.removerProduto(item.id);
                            },
                          );
                        },
                      ),
              ),
              const Divider(color: Colors.black),
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

class _Item extends StatelessWidget {
  const _Item({
    // ignore: unused_element
    super.key,
    required this.item,
    required this.onPressedAdicionaQuantidade,
    required this.onPressedRemoverQuantidade,
    required this.onPressedRemoverProduto,
  });

  final CarrinhoProdutoModel item;
  final Function() onPressedAdicionaQuantidade;
  final Function() onPressedRemoverQuantidade;
  final Function() onPressedRemoverProduto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const SizedBox(
            width: 50,
            height: 50,
            child: Placeholder(),
          ),
          title: Text(item.nome),
          subtitle: Text("${item.quantidade} - ${item.precoQuantidade}"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: onPressedAdicionaQuantidade,
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: onPressedRemoverQuantidade,
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: onPressedRemoverProduto,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        const Divider(color: Colors.black),
      ],
    );
  }
}
