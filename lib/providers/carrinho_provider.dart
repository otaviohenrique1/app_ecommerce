import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/carrinho_produto_model.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<CarrinhoProdutoModel> _carrinhoListaProdutos = [];

  List<CarrinhoProdutoModel> get carrinhoListaProdutos =>
      _carrinhoListaProdutos;

  int get quantodadeItensTotal => _carrinhoListaProdutos.length;

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

    if (buscaItem.id == produto.id) {
      atualizarQuantidade(produto.id);
    } else {
      _carrinhoListaProdutos.add(produto);
      notifyListeners();
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
        double resultado =
            _carrinhoListaProdutos[i].quantidade - novaQuantidade;
        if (resultado <= 0) {
          _carrinhoListaProdutos[i].quantidade = 1;
          _carrinhoListaProdutos[i].precoQuantidade =
              1 * _carrinhoListaProdutos[i].preco;
        } else {
          _carrinhoListaProdutos[i].quantidade = resultado;
          _carrinhoListaProdutos[i].precoQuantidade =
              _carrinhoListaProdutos[i].quantidade *
                  _carrinhoListaProdutos[i].preco;
        }
        break;
      }
    }
    notifyListeners();
  }
}
