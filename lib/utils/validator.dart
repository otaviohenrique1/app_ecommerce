String? validaCampoVazio(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo vazio";
  }
  return null;
}
