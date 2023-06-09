import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      ),
      body: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          ProdutoModel item = listaProdutos[index];
          String nome = item.nome;
          String categoria = item.categoria;
          String descricao = item.descricao;
          double preco = item.preco;
          String precoFormatado =
              "R\$ ${preco.toStringAsFixed(2).replaceAll(".", ",")}";
          String uuid = geraUuid();
          String dataHora = geraDataHoraFormatada();

          return ListTile(
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
        },
      ),
    );
  }
}
