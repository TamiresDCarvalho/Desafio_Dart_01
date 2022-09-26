import 'endereco.dart';

class Socio extends Endereco {
  String nome;
  String cpf;

  Socio({
    required this.nome,
    required this.cpf,
    required super.logradouro,
    required super.bairro,
    required super.cep,
    required super.complemento,
    required super.estado,
    required super.numero
  });

  // Métodos Getters and Setters
  String get Nome {
    return nome;
  }

  String get Cpf {
    return cpf;
  }

  set Nome(String nome) {
    this.nome = nome;
  }

  set Cpf(String cpf) {
    if (cpf.length == 11) {
      this.cpf = cpf;
      return;
    }

    print("CPF inválido. Informe um CPF com 11 dígitos.");
  }
}
