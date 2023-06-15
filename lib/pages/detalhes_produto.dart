import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/produto_model.dart';
import 'package:app_ecommerce/utils/listas.dart';

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
        foto: "",
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
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image(
              height: 200,
              image: AssetImage(produto.foto),
              fit: BoxFit.contain,
            ),
            Text(produto.id),
            Text(produto.nome),
            Text(produto.preco.toString()),
            Text(produto.categoria),
            Text(produto.descricao),
            Text(produto.dataCriacao),
          ],
        ),
      ),
    );
  }
}
