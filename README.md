# Projeto Flutter - Atividade Avaliativa (P1)
- Este projeto consiste em um aplicativo mobile desenvolvido em Flutter que implementa um fluxo completo de autenticação simulada, navegação entre telas e organização arquitetural seguindo o padrão sugerido em aula.

## Integrantes do Grupo:
* **Thales Vasconcellos Tardelli Sabbag de Paula**
* **Fernando Nogueira da Silva**
* **Matheus Barrense dos Santos**

---

## Arquitetura do Projeto:
- O sistema foi estruturado para demonstrar a separação de responsabilidades, garantindo que a lógica de negócio não esteja acoplada à interface de usuário:

* **Models**: Representação dos dados do usuário (`UsuarioModel`).
* **Data**: Camada de persistência em memória (`UsuarioMockStore`) que utiliza uma lista estática para simular um banco de dados.
* **ViewModels**: Classes responsáveis por deter a lógica de navegação, validação de formulários e regras de autenticação.
* **Views**: Telas construídas com widgets básicos do Flutter (Splash, Login, Cadastro e Home).
* **Routes**: Gerenciamento centralizado de rotas nomeadas para facilitar a navegação.

---

## Demonstração do Fluxo Obrigatório:
- O aplicativo executa o fluxo completo exigido pela atividade:

1.  **Splash Screen**: Primeira tela exibida com carregamento temporizado de 3 segundos.
2.  **Tela de Login**: Interface para entrada de usuários com validação de campos e busca na lista mockada.
3.  **Tela de Cadastro**: Permite o registro de novos usuários, armazenando os dados em memória através do Model.
4.  **Retorno ao Login**: Fluxo de navegação que permite ao usuário recém-cadastrado voltar para se autenticar.
5.  **Autenticação Correta**: Verificação de e-mail e senha na estrutura `List<UsuarioModel>`.
6.  **Navegação para Home**: Acesso à área restrita após sucesso no login.

---

## Requisitos Técnicos Respeitados:
* **Dados Mockados**: O armazenamento é feito estritamente em memória. Não foram utilizados Firebase, bancos de dados externos ou APIs.
* **Widgets de Layout**: Uso de `Container`, `Column`, `Row`, `Padding` e alinhamentos conforme solicitado.
* **Formulários**: Implementação de `TextFormField` com `GlobalKey<FormState>` para validação obrigatória.
* **Diferenciais**: Inclusão de mensagens de erro/sucesso (SnackBars) e funcionalidade de ocultar/exibir senha.

---

## Tela Home:
- Conforme o requisito, a tela Home contém um ícone centralizado e um texto de boas-vindas centralizado.

---

*Projeto desenvolvido para fins acadêmicos - 2026*
