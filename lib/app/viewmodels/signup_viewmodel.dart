import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class SignupViewModel {
  void cadastrarUsuario(String nome, String email, String senha) {
    final novo = UsuarioModel(nome: nome, email: email, senha: senha);
    UsuarioMockStore.adicionarUsuario(novo);
  }

  String? validarCampo(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo Obrigatório";
    }
    return null;
  }
}
