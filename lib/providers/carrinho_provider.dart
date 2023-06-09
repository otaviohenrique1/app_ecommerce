import 'package:flutter/cupertino.dart';

import '../models/carrinho_produto_model.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<CarrinhoProdutoModel> _carrinhoListaProdutos = [];
  double _precoTotal = 0;

  List<CarrinhoProdutoModel> get carrinhoListaProdutos =>
      _carrinhoListaProdutos;

  double get precoTotal => _precoTotal;

  adicionaProduto(CarrinhoProdutoModel produto) {
    CarrinhoProdutoModel buscaItem = _carrinhoListaProdutos.firstWhere(
      (element) => element.id == produto.id,
      orElse: () => CarrinhoProdutoModel(
        id: "",
        nome: "",
        preco: 0,
        categoria: "",
        descricao: "",
        quantidade: 0,
        precoQuantidade: 0,
        dataCriacao: "",
      ),
    );

    if (buscaItem.id != produto.id) {
      _carrinhoListaProdutos.add(produto);
      notifyListeners();
    } else {
      atualizarQuantidade(produto.id);
    }
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

  atualizarQuantidade(String id) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      if (_carrinhoListaProdutos[i].id == id) {
        _carrinhoListaProdutos[i].quantidade =
            _carrinhoListaProdutos[i].quantidade + 1;
        _carrinhoListaProdutos[i].precoQuantidade =
            _carrinhoListaProdutos[i].quantidade *
                _carrinhoListaProdutos[i].preco;
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
