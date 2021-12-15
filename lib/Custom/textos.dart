
import '../controllers.dart/converter.dart';

class Texto {
  static produtoMaisEconomico(produto) {
    return 'Mais econômico: $produto';
  }

  static final mesmoCusto = 'Os dois produtos tem o mesmo custo';

  static economiza(produto, double diferenca) {
    return 'Comprando o produto $produto você economiza ${Converter.doubleParaReais(diferenca)}';
  }
}

class Erro {
  static final campoVazio = 'Preencha todos os campos';
  static final campoIncorreto = 'Preencha os campos corretamente';
  static final pesoIncorreto = 'O peso não pode ser 0';
  static final precoIncorreto = 'O preço não pode ser R\$ 0,00';
  // static final campoVazioRegraDeTres = 'Preencha 3 campos';
  // static final campoVazioFaltando = 'Preencha apenas 3 campos';
}


