import 'package:flutter/cupertino.dart';

import '../models/carrinho_produto_model.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<CarrinhoProdutoModel> _carrinhoListaProdutos = [];
  double _precoTotal = 0;

  List<CarrinhoProdutoModel> get carrinhoListaProdutos =>
      _carrinhoListaProdutos;

  double get precoTotal => _precoTotal;

  int get quantodadeItensTotal => _carrinhoListaProdutos.length;

  // buscaTodos () {
  //   _carrinhoListaProdutos
  // }

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
  }

  atualizarQuantidade(String id) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      CarrinhoProdutoModel item = _carrinhoListaProdutos[i];
      if (item.id == id) {
        item.quantidade = item.quantidade + 1;
        item.precoQuantidade = item.quantidade * item.preco;
        break;
      }
    }
    notifyListeners();
  }

  adicionaQuantidade(String id, double novaQuantidade) {
    for (var i = 0; i < _carrinhoListaProdutos.length; i++) {
      CarrinhoProdutoModel item = _carrinhoListaProdutos[i];
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
      CarrinhoProdutoModel item = _carrinhoListaProdutos[i];
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
