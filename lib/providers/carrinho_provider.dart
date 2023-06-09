import 'package:flutter/cupertino.dart';

import '../models/carrinho_produto_model.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<CarrinhoProdutoModel> _carrinhoListaProdutos = [];
  double _precoTotal = 0;

  List<CarrinhoProdutoModel> get carrinhoListaProdutos =>
      _carrinhoListaProdutos;

  double get precoTotal => _precoTotal;

  adicionarProduto(CarrinhoProdutoModel produto) {
    _carrinhoListaProdutos.add(produto);
    notifyListeners();
  }

  calculaValorTotal() {
    _precoTotal = _carrinhoListaProdutos
        .map((produto) => produto.preco)
        .reduce((valor1, valor2) => valor1 + valor2);
    notifyListeners();
  }

  removerProduto(String id) {
    _carrinhoListaProdutos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  limparLista() {
    _carrinhoListaProdutos = [];
  }

  atualizarPorQuantidade(String id, double quantidade, double precoQuantidade) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      if (_carrinhoListaProdutos[i].id == id) {
        _carrinhoListaProdutos[i].quantidade = quantidade;
        _carrinhoListaProdutos[i].precoQuantidade = precoQuantidade;
        break;
      }
    }
    notifyListeners();
  }

  adicionaQuantidade(String id, double novaQuantidade) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      if (_carrinhoListaProdutos[i].id == id) {
        _carrinhoListaProdutos[i].quantidade =
            _carrinhoListaProdutos[i].quantidade + novaQuantidade;
        _carrinhoListaProdutos[i].precoQuantidade =
            _carrinhoListaProdutos[i].quantidade *
                _carrinhoListaProdutos[i].preco;
        break;
      }
    }
    notifyListeners();
  }

  removerQuantidade(String id, double novaQuantidade) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      if (_carrinhoListaProdutos[i].id == id) {
        _carrinhoListaProdutos[i].quantidade =
            _carrinhoListaProdutos[i].quantidade - novaQuantidade;
        _carrinhoListaProdutos[i].precoQuantidade =
            _carrinhoListaProdutos[i].quantidade *
                _carrinhoListaProdutos[i].preco;
        break;
      }
    }
    notifyListeners();
  }
}
