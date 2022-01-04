
import '../controllers.dart/converter.dart';

class Texto {
  static produtoMaisEconomico(produto) {
    return 'Mais econômico: $produto';
  }

  static const mesmoCusto = 'Os dois produtos tem o mesmo custo';

  static economiza(produto, double diferenca) {
    return 'Comprando o produto $produto você economiza ${Converter.doubleParaReais(diferenca)}';
  }
}

class Erro {
  static const campoVazio = 'Preencha todos os campos';
  static const campoIncorreto = 'Preencha os campos corretamente';
  static const pesoIncorreto = 'O peso não pode ser 0';
  static const precoIncorreto = 'O preço não pode ser R\$ 0,00';
  static const campoVazioRegraDeTres = 'Preencha 3 campos';
  static const campoVazioFaltando = 'Preencha apenas 3 campos';
}


