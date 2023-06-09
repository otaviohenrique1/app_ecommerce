class ProdutoModel {
  ProdutoModel({
    required this.id,
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.descricao,
    required this.dataCriacao,
  });

  String id;
  String nome;
  double preco;
  String categoria;
  String descricao;
  String dataCriacao;
}
