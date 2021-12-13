class Converter {
  static double stringParaDouble(String text) {
    return double.parse(text.replaceAll(",", "."));
  }

  static double reaisParaDouble(String text) {
    return double.parse(
        text.replaceAll(".", "").replaceAll(",", ".").replaceAll("R\$", ""));
  }

  static String doubleParaReais(double preco) {
  return "R\$ ${preco.toStringAsFixed(2).replaceAll(".", ",")}";
}

}
