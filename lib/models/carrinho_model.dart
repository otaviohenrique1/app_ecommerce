import 'package:app_ecommerce/models/carrinho_produto_model.dart';

class CarrinhoModel {
  CarrinhoModel({
    required this.id,
    required this.carrinhoListaProdutos,
    required this.precoTotal,
    required this.dataCriacao,
  });

  String id;
  List<CarrinhoProdutoModel> carrinhoListaProdutos;
  double precoTotal;
  String dataCriacao;
}
