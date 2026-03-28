import '../models/usuario_model.dart';

class UsuarioMockStore {
  static List<UsuarioModel> usuarios = [];

  static void adicionarUsuario(UsuarioModel usuario) {
    usuarios.add(usuario);
  }

  static UsuarioModel? buscarUsuario(String email, String senha) {
    try {
      return usuarios.firstWhere((u) => u.email == email && u.senha == senha);
    } catch (e) {
      return null;
    }
  }
}
