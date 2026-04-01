import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _viewModel = LoginViewModel();
  final _formKey = GlobalKey<FormState>(); // Chave para validar o formulário
  final _emailController =
      TextEditingController(); // Esses dois são para controlar o texto que o usuário irá digitar
  final _senhaController =
      TextEditingController(); // Esses dois são para controlar o texto que o usuário irá digitar
  bool _senhaOculta = true;

  void _fazerLogin() {
    //verifica se o usuario está no Map
    if (_formKey.currentState!.validate()) {
      final usuario = _viewModel.autenticar(
        _emailController.text,
        _senhaController.text,
      );

    if (usuario == null) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário ou senha incorretos!"),
          backgroundColor: Colors.red,
          )
        );
    }
    Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    Icons.lock_person,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Acesse Sua Conta",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),

                // Campo de Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Por favor, informe seu email"
                      : null,
                ),
                const SizedBox(
                  height: 16,
                ),

                // Campo de Senha
                TextFormField(
                  controller: _senhaController,
                  obscureText: _senhaOculta,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: const Icon(Icons.lock_person_outlined),
                    border: const OutlineInputBorder(),
                    // Ícone para ocultar a senha quando digita
                    suffixIcon: IconButton(
                      icon: Icon(
                        _senhaOculta ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        // Inverte o estado do olhinho
                        setState(() {
                          _senhaOculta = !_senhaOculta;
                        });
                      },
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Por favor, informe sua senha"
                      : null,
                ),

                // Botão para entrar na home
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _fazerLogin,
                    child: const Text("ENTRAR"),
                  ),
                ),

                // Ir para tela de cadastro
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: const Text("Não possuí cadastro? Clique aqui"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  }
}
