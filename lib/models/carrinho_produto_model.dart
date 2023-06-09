import 'package:app_ecommerce/models/produto_model.dart';

class CarrinhoProdutoModel extends ProdutoModel {
  CarrinhoProdutoModel({
    required super.id,
    required super.nome,
    required super.preco,
    required super.categoria,
    required super.descricao,
    required super.dataCriacao,
    required this.quantidade,
    required this.precoQuantidade,
  });

  double quantidade;
  double precoQuantidade;
}
