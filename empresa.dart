import 'endereco.dart';
import 'socio.dart';

class Empresa extends Endereco {
  int id;
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  String telefone;
  DateTime horarioCadastro;
  Socio socio;

  Empresa({
    required this.id,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.telefone,
    required this.horarioCadastro,
    required this.socio,
    required super.logradouro,
    required super.numero,
    required super.complemento,
    required super.bairro,
    required super.estado,
    required super.cep
  });

  // Métodos Getters and Setters
  int get Id {
    return id;
  }

  String get RazaoSocial {
    return razaoSocial;
  }

  String get NomeFantasia {
    return nomeFantasia;
  }

  String get Cnpj {
    return cnpj;
  }

  String get Telefone {
    return telefone;
  }

  DateTime get HorarioCadastro {
    return horarioCadastro;
  }

  set Id(int id) {
    this.id = id;
  }

  set RazaoSocial(String razaoSocial) {
    this.razaoSocial = razaoSocial;
  }

  set NomeFantasia(String nomeFantasia) {
    this.nomeFantasia = nomeFantasia;
  }

  set Cnpj(String cnpj) {
    this.cnpj = cnpj;
  }

  set Telefone(String telefone) {
    this.telefone = telefone;
  }

  set HorarioCadastro(DateTime horarioCadastro) {
    this.horarioCadastro = horarioCadastro;
  }
}
