import 'package:app_ecommerce/models/produto_model.dart';
import 'package:app_ecommerce/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/carrinho_produto_model.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<CarrinhoProdutoModel> _carrinhoListaProdutos = [];

  List<CarrinhoProdutoModel> get carrinhoListaProdutos =>
      _carrinhoListaProdutos;

  int get quantodadeItensTotal => _carrinhoListaProdutos.length;

  adicionaProduto(ProdutoModel produto, String produtoId) {
    CarrinhoProdutoModel buscaItem = _carrinhoListaProdutos.firstWhere(
      (element) => element.produtoId == produtoId,
      orElse: () => CarrinhoProdutoModel(
        id: "",
        nome: "",
        preco: 0,
        categoria: "",
        descricao: "",
        produtoId: "",
        quantidade: 0,
        precoQuantidade: 0,
        dataCriacao: "",
      ),
    );

    if (buscaItem.produtoId != produtoId) {
      _carrinhoListaProdutos.add(CarrinhoProdutoModel(
        id: geraUuid(),
        produtoId: produto.id,
        nome: produto.nome,
        preco: produto.preco,
        categoria: produto.categoria,
        descricao: produto.descricao,
        dataCriacao: produto.dataCriacao,
        quantidade: 1,
        precoQuantidade: produto.preco * 1,
      ));
      notifyListeners();
    } else {
      atualizarQuantidade(produto.id);
      notifyListeners();
    }
  }

  atualizarQuantidade(String id) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      var item = _carrinhoListaProdutos[i];
      if (item.produtoId == id) {
        item.quantidade = item.quantidade + 1;
        item.precoQuantidade = item.quantidade * item.preco;
        break;
      }
    }
  }

  double calculaValorTotal() {
    double total = 0;
    if (_carrinhoListaProdutos.isNotEmpty) {
      total = _carrinhoListaProdutos
          .map((produto) => produto.precoQuantidade)
          .reduce((valor1, valor2) => valor1 + valor2);
    } else {
      total = 0;
    }
    return total;
  }

  removerProduto(String id) {
    _carrinhoListaProdutos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  limparLista() {
    _carrinhoListaProdutos = [];
    notifyListeners();
  }

  adicionaQuantidade(String id, double novaQuantidade) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      var item = _carrinhoListaProdutos[i];
      if (item.id == id) {
        item.quantidade = item.quantidade + novaQuantidade;
        item.precoQuantidade = item.quantidade * item.preco;
        break;
      }
    }
    notifyListeners();
  }

  removerQuantidade(String id, double novaQuantidade) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      var item = _carrinhoListaProdutos[i];
      if (item.id == id) {
        double resultado = item.quantidade - novaQuantidade;
        if (resultado <= 0) {
          item.quantidade = 1;
          item.precoQuantidade = 1 * item.preco;
        } else {
          item.quantidade = resultado;
          item.precoQuantidade = item.quantidade * item.preco;
        }
        break;
      }
    }
    notifyListeners();
  }
}
