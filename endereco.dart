class Endereco {
  String logradouro;
  int numero;
  String complemento;
  String bairro;
  String estado;
  String cep;

  Endereco({
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.estado,
    required this.cep
  });


  // Métodos Getters and Setters
  String get Logradouro {
    return logradouro;
  }

  int get Numero {
    return numero;
  }

  String get Complemento {
    return complemento;
  }

  String get Bairro {
    return bairro;
  }

  String get Estado {
    return estado;
  }

  String get Cep {
    return cep;
  }

  set Logradouro (String logradouro) {
    this.logradouro = logradouro;
  }

  set Numero (int numero) {
    this.numero = numero;
  }

  set Complemento (String complemento) {
    this.complemento = complemento;
  }

  set Bairro (String bairro) {
    this.bairro = bairro;
  }

  set Estado (String estado) {
    this.estado = estado;
  }

  set Cep (String cep) {
    this.cep = cep;
  }

}