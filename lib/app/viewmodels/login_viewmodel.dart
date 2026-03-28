import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class LoginViewModel {
  UsuarioModel? autenticar(String email, String senha) {
    return UsuarioMockStore.buscarUsuario(email, senha);
  }

  String? validarCampo(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo Obrigatório";
    }
    return null;
  }
}
