import 'package:app_ecommerce/models/produto_model.dart';
import 'package:app_ecommerce/providers/produto_provider.dart';
import 'package:app_ecommerce/utils/listas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesProduto extends StatefulWidget {
  const DetalhesProduto({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<DetalhesProduto> createState() => _DetalhesProdutoState();
}

class _DetalhesProdutoState extends State<DetalhesProduto> {
  @override
  Widget build(BuildContext context) {
    ProdutoModel produto = listaProdutosTeste.firstWhere(
      (element) => element.id == widget.id,
      orElse: () => ProdutoModel(
        id: "",
        nome: "",
        preco: 0,
        categoria: "",
        descricao: "",
        dataCriacao: "",
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(produto.id),
          Text(produto.nome),
          Text(produto.preco.toString()),
          Text(produto.categoria),
          Text(produto.descricao),
          Text(produto.dataCriacao),
        ],
      ),
    );
  }
}
