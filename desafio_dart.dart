import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'empresa.dart';
import 'socio.dart';

void main() {
  final myCompanies = <Empresa>[];

  String option = "";

  cls();

  do {
    print(
      ''' 
      1) Cadastrar uma nova empresa
      2) Buscar Empresa cadastrada por CNPJ
      3) Buscar Empresa por CPF do Sócio
      4) Listar Empresas cadastradas em ordem alfabética
      5) Excluir uma empresa (por ID)
      6) Sair
    ''',
    );

    option = stdin.readLineSync(encoding: utf8)!;

    switch (option) {
      case '1':
        cls();
        addNewCompany(myList: myCompanies);
        break;
      case '2':
        cls();
        findCompanyByCnpj(myCompanies);
        break;
      case '3':
        cls();
        findCompanyBySocioCpf(myCompanies);
        break;
      case '4':
        cls();
        orderCompanies(myCompanies);
        break;
      case '5':
        cls();
        deleteCompany(myCompanies);
        break;
      case '6':
        cls();
        print("Obrigado por usar nosso app, volte sempre!");
        break;
      default:
        print("Opção digitada é inválida, tente novamente!\n\n");
        break;
    }
  } while (option != "0");
}

void addNewCompany({required List<Empresa> myList}) {
  print("Vamos começar cadastrando o sócio da empresa.\n");
  print("Digite o nome do sócio: ");
  String nomeSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o cpf do sócio (Apenas números): ");
  String cpfSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o logradouro do endereço do sócio: ");
  String logradouroSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o bairro do endereço do sócio: ");
  String bairroSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o cep do endereço do sócio: ");
  String cepSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o complemento do endereço sócio: ");
  String complementoSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o estado do endereço do sócio: ");
  String estadoSocio = stdin.readLineSync(encoding: utf8)!;

  print("Digite o número do endereço do sócio: ");
  String numeroEnderecoSocio = stdin.readLineSync(encoding: utf8)!;

  Socio socio1 = Socio(
      nome: nomeSocio,
      cpf: cpfSocio,
      logradouro: logradouroSocio,
      bairro: bairroSocio,
      cep: cepSocio,
      complemento: complementoSocio,
      estado: estadoSocio,
      numero: int.parse(numeroEnderecoSocio));

  cls();
  print("Agora vamos cadastrar os dados da empresa.\n");
  print("Digite a razão social da empresa: ");
  String razaoSocialEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o nome fantasia da empresa: ");
  String nomeFantasiaEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o CNPJ da empresa (Apenas números): ");
  String cnpjEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o telefone da empresa (Apenas números): ");
  String telefoneEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o logradouro do endereço da empresa: ");
  String logradouroEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o bairro do endereço da empresa: ");
  String bairroEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o cep do endereço da empresa: ");
  String cepEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o complemento do endereço da empresa: ");
  String complementoEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o estado do endereço da empresa: ");
  String estadoEmp = stdin.readLineSync(encoding: utf8)!;

  print("Digite o número do endereço da empresa: ");
  String numeroEmp = stdin.readLineSync(encoding: utf8)!;

  // Gerando ID aleatorio para empresa
  final random = Random();
  int idEmpresa = random.nextInt(100);

  var companyFiltered = myList.where((e) => e.id == idEmpresa);

  while (companyFiltered.length > 0) {
    idEmpresa = random.nextInt(100);
    companyFiltered = myList.where((e) => e.id == idEmpresa);
  }
  // Gerando ID aleatorio para empresa

  // Pegando a data e a hora do cadastro da empresa
  final dataHoraCadastro = DateTime.now();
  // Pegando a data e a hora do cadastro da empresa

  Empresa newCompany = Empresa(
      id: idEmpresa,
      razaoSocial: razaoSocialEmp,
      nomeFantasia: nomeFantasiaEmp,
      cnpj: cnpjEmp,
      telefone: telefoneEmp,
      horarioCadastro: dataHoraCadastro,
      socio: socio1,
      logradouro: logradouroEmp,
      numero: int.parse(numeroEmp),
      complemento: complementoEmp,
      bairro: bairroEmp,
      estado: estadoEmp,
      cep: cepEmp);

  myList.add(newCompany);
  cls();
  print("Empresa: $razaoSocialEmp cadastrada com sucesso!");
}

void findCompanyByCnpj(List<Empresa> myCompanies) {
  print("Digite o CNPJ da empresa que deseja encontrar: ");
  String cnpjFilter = stdin.readLineSync(encoding: utf8)!;

  var companyFiltered = myCompanies.where((e) => e.cnpj == cnpjFilter);

  if (companyFiltered.length > 0) {
    Empresa companyFilter = companyFiltered.first;
    print("A empresa que você buscou é: \n");
    showItem(companyFilter);
  } else {
    print("Empresa não encontrada. \nPor favor, tente novamente!");
    return;
  }
}

void findCompanyBySocioCpf(List<Empresa> myCompanies) {
  print("Digite o CPF do socio da empresa que deseja encontrar: ");
  String cpfFilter = stdin.readLineSync(encoding: utf8)!;

  var companyFiltered = myCompanies.where((e) => e.socio.cpf == cpfFilter);

  if (companyFiltered.length > 0) {
    Empresa companyFilter = companyFiltered.first;
    print("A empresa que você buscou é: \n");
    showItem(companyFilter);
  } else {
    print("Empresa não encontrada. \nPor favor, tente novamente!");
    return;
  }
}

void orderCompanies(List<Empresa> myCompanies) {
  print("Essa é sua lista em ordem alfabética!");

  myCompanies.sort((a, b) =>
      a.razaoSocial.toUpperCase().compareTo(b.razaoSocial.toUpperCase()));
  showList(myCompanies);
}

void deleteCompany(List<Empresa> myCompanies) {
  print("Digite o ID da empresa que deseja remover: ");
  String idEmpresa = stdin.readLineSync(encoding: utf8)!;

  var companyFiltered = myCompanies.where((e) => e.id == int.parse(idEmpresa));

  if (companyFiltered.length > 0) {
    myCompanies.removeWhere((e) => e.id == int.parse(idEmpresa));
    print("Empresa removida com sucesso!");
  } else {
    print("Empresa não encontrada. \nPor favor, tente novamente!");
    return;
  }
}

void showList(List<Empresa> myList) {
  if (myList.isEmpty) {
    print("Sua lista está vazia!");
    return;
  }

  print("A Lista de empresas é: ");

  for (int i = 0; i < myList.length; i++) {
    showItem(myList[i]);
  }

  print('');
}

void showItem(Empresa company) {
  print("ID: ${company.Id}");
  print("CNPJ: ${company.cnpj} - Data cadastro: ${company.horarioCadastro}");
  print("Razão Social: ${company.razaoSocial}");
  print("Nome Fantasia: ${company.nomeFantasia}");
  print("Telefone:  ${company.telefone}");
  print(
      "Endereço:  ${company.logradouro}, ${company.numero}, ${company.bairro}, ${company.complemento}, ${company.estado}, ${company.cep}");
  print("Sócio: ");
  print("CPF:  ${company.socio.cpf}");
  print("Nome Completo:  ${company.socio.nome}");
  print(
      "Endereço:  ${company.socio.logradouro}, ${company.socio.numero}, ${company.socio.bairro}, ${company.socio.complemento}, ${company.socio.estado}, ${company.socio.cep}");
  print("\n");
}

// CLS == Clear Screen == Limpar tela
void cls() => print("\x1B[2J\x1B[0;0H");