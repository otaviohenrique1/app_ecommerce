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
      body: _Lista(lista: listaProdutos),
    );
  }
}

class _Lista extends StatelessWidget {
  const _Lista({
    // ignore: unused_element
    super.key,
    required this.lista,
  });

  final List<ProdutoModel> lista;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        ProdutoModel item = lista[index];
        String nome = item.nome;
        String categoria = item.categoria;
        String descricao = item.descricao;
        double preco = item.preco;
        String precoFormatado =
            "R\$ ${preco.toStringAsFixed(2).replaceAll(".", ",")}";
        String uuid = geraUuid();
        String dataHora = geraDataHoraFormatada();

        return _Item(
          nome: nome,
          precoFormatado: precoFormatado,
          uuid: uuid,
          preco: preco,
          categoria: categoria,
          descricao: descricao,
          dataHora: dataHora,
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    // ignore: unused_element
    super.key,
    required this.nome,
    required this.precoFormatado,
    required this.uuid,
    required this.preco,
    required this.categoria,
    required this.descricao,
    required this.dataHora,
  });

  final String nome;
  final String precoFormatado;
  final String uuid;
  final double preco;
  final String categoria;
  final String descricao;
  final String dataHora;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        width: 50,
        height: 50,
        child: Placeholder(),
      ),
      title: Text(nome),
      subtitle: Text(precoFormatado),
      trailing: Consumer<CarrinhoProvider>(
        builder: (context, carrinhoProviderConsumer, child) {
          return IconButton(
            onPressed: () {
              double quantidade = 1;
              carrinhoProviderConsumer.adicionaProduto(
                CarrinhoProdutoModel(
                  id: uuid,
                  nome: nome,
                  preco: preco,
                  categoria: categoria,
                  descricao: descricao,
                  quantidade: quantidade,
                  precoQuantidade: preco * quantidade,
                  dataCriacao: dataHora,
                ),
              );
            },
            icon: const Icon(Icons.add, size: 32),
          );
        },
      ),
    );
  }
}
