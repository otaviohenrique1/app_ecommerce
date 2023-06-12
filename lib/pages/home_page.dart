import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_ecommerce/pages/carrinho_compras.dart';
import 'package:app_ecommerce/utils/helpers.dart';
import 'package:app_ecommerce/utils/listas.dart';
import 'package:app_ecommerce/models/produto_model.dart';
import 'package:app_ecommerce/models/carrinho_produto_model.dart';
import 'package:app_ecommerce/providers/carrinho_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<ProdutoModel> lista = listaProdutosTeste;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CarrinhoCompras(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
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
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          ProdutoModel item = lista[index];

          return ListTile(
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: Placeholder(),
            ),
            title: Text(item.nome),
            subtitle: Text(
                "R\$ ${item.preco.toStringAsFixed(2).replaceAll(".", ",")}"),
            trailing: Consumer<CarrinhoProvider>(
              builder: (context, carrinhoProviderConsumer, child) {
                return IconButton(
                  onPressed: () {
                    carrinhoProviderConsumer.adicionaProduto(
                      ProdutoModel(
                        id: geraUuid(),
                        nome: item.nome,
                        preco: item.preco,
                        categoria: item.categoria,
                        descricao: item.descricao,
                        dataCriacao: geraDataHoraFormatada(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, size: 32),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
