import 'package:flutter/material.dart';
import 'package:app_ecommerce/utils/listas.dart';
import 'package:app_ecommerce/models/produto_model.dart';

class ProdutoProvider extends ChangeNotifier {
  List<ProdutoModel> _listaProdutos = [];
  ProdutoModel _produto = ProdutoModel(
    id: "",
    nome: "",
    preco: 0,
    categoria: "",
    descricao: "",
    dataCriacao: "",
  );

  List<ProdutoModel> get listaProdutos => _listaProdutos;
  ProdutoModel get produto => _produto;

  adicionar(ProdutoModel produto) {
    _listaProdutos.add(produto);
    buscaTodos();
  }

  remover(ProdutoModel produto) {
    _listaProdutos.add(produto);
    buscaTodos();
  }

  atualizar(ProdutoModel produto, String produtoId) {
    for (var i = 0; i < _listaProdutos.length; i++) {
      ProdutoModel item = _listaProdutos[i];
      if (item.id == produtoId) {
        item.nome = produto.nome;
        item.preco = produto.preco;
        item.categoria = produto.categoria;
        item.descricao = produto.descricao;
        break;
      }
    }
    _listaProdutos.add(produto);
    buscaTodos();
  }

  buscarPorId(String produtoId) {
    ProdutoModel item = _listaProdutos.firstWhere(
      (element) => element.id == produtoId,
      orElse: () => ProdutoModel(
        id: "",
        nome: "",
        preco: 0,
        categoria: "",
        descricao: "",
        dataCriacao: "",
      ),
    );
    if (item.id == produtoId) {
      _produto = item;
    } else {
      _produto = ProdutoModel(
        id: "",
        nome: "",
        preco: 0,
        categoria: "",
        descricao: "",
        dataCriacao: "",
      );
    }
  }

  buscaTodos() {
    _listaProdutos = listaProdutosTeste;
    notifyListeners();
  }
}
