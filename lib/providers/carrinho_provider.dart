import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/carrinho_produto_model.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<CarrinhoProdutoModel> _carrinhoListaProdutos = [];

  List<CarrinhoProdutoModel> get carrinhoListaProdutos =>
      _carrinhoListaProdutos;

  int get quantodadeItensTotal => _carrinhoListaProdutos.length;

  adicionaProduto(CarrinhoProdutoModel produto, String id) {
    int index =
        _carrinhoListaProdutos.indexWhere((item) => item.id == produto.id);
    if (index >= 0) {
      atualizarQuantidade(produto.id);
      notifyListeners();
    } else {
      _carrinhoListaProdutos.add(produto);
      notifyListeners();
    }
    // if (index == -1) {
    //   _carrinhoListaProdutos.add(produto);
    //   print(index);
    //   print("id => $id");
    //   print("produto.id => ${produto.id}");
    //   notifyListeners();
    // } else {
    //   print(index);
    //   atualizarQuantidade(id);
    //   notifyListeners();
    // }
    // int index = produtos.indexWhere((produto) => produto.id == novoProduto.id);

    // CarrinhoProdutoModel buscaItem = _carrinhoListaProdutos.firstWhere(
    //   (element) => element.id == id,
    //   orElse: () => CarrinhoProdutoModel(
    //     id: "",
    //     nome: "",
    //     preco: 0,
    //     categoria: "",
    //     descricao: "",
    //     quantidade: 0,
    //     precoQuantidade: 0,
    //     dataCriacao: "",
    //   ),
    // );

    // if (buscaItem.id == id) {
    //   atualizarQuantidade(id);
    //   notifyListeners();
    // } else {
    //   _carrinhoListaProdutos.add(produto);
    //   notifyListeners();
    // }

    // var buscaItem2 = _carrinhoListaProdutos.where((element) {
    //   // print(element.id == id);
    //   print("buscaItem.id => ${buscaItem.id}");
    //   print("produto.id => ${produto.id}");
    //   print("element.id => ${element.id}");
    //   print("id => $id");
    //   return element.id == id;
    // });

    // print("_carrinhoListaProdutos => $_carrinhoListaProdutos");
    // print("buscaItem => $buscaItem");
    // if (buscaItem2.isEmpty) {
    // if (buscaItem.id == "") {
    //   _carrinhoListaProdutos.add(produto);
    //   notifyListeners();
    // } else {
    //   atualizarQuantidade(id);
    //   notifyListeners();
    // }
    // if (buscaItem.isEmpty) {
    //   _carrinhoListaProdutos.add(produto);
    //   print("_carrinhoListaProdutos => $_carrinhoListaProdutos");
    //   print("buscaItem => $buscaItem");
    //   notifyListeners();
    // } else {
    //   // print("buscaItem => ${buscaItem.isEmpty}");
    //   atualizarQuantidade(id);
    //   // print("_carrinhoListaProdutos => $_carrinhoListaProdutos");
    //   // print("buscaItem => $buscaItem");
    //   notifyListeners();
    // }
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
