import 'package:flutter/material.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _viewmodel = SignupViewModel();
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  //Ativa o método verificador de cada objeto TextEditing Controller
  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      _viewmodel.cadastrarUsuario(
        _nomeController.text,
        _emailController.text,
        _senhaController.text,
      );
      //Se todos os testes de verificação retornarem null, ele cadastra no Map e emite uma mensagem na SnackBar(A barra baixa da código)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cadastro Realizado!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.person_add,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome Completo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Informe seu nome" : null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // Verifica se o campo está vazio
                  if (value == null || value.isEmpty) {
                    return "Informe seu Email";
                  }
                  // Verifica se NÃO contém @ ou se NÃO termina com .com
                  if (!value.contains("@") || !value.endsWith(".com")) {
                    return "Informe um Email válido";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Crie uma Senha" : null,
              ),
              const SizedBox(
                height: 30,
              ),

              SizedBox(
                width: double.infinity,
                height: 50,
                //Botão que executa a função Cadastrar
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text("SALVAR CADASTRO"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
