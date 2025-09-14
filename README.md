# To-Do App

Este é um **To-Do App** desenvolvido com **Flutter**, que permite aos usuários adicionar, editar, excluir e marcar tarefas como concluídas. O app usa **Hive** para armazenar as tarefas localmente e permite que o usuário organize suas tarefas em diferentes filtros (como "A fazer" e "Concluídas").

## Funcionalidades

- **Adicionar** tarefas

- **Editar** tarefas

- **Excluir** tarefas

- **Marcar como concluída** tarefas

- Filtros de tarefas:

  - Todas

  - A fazer

  - Concluídas

- Armazenamento local usando **Hive**.

## Tecnologias

Este projeto foi desenvolvido usando as seguintes tecnologias:

- **Flutter**: Framework para criar apps nativos de alta performance.

- **Dart**: Linguagem usada no desenvolvimento com Flutter.

- **Hive**: Banco de dados local para persistência de dados.

- **GetIt**: Biblioteca para injeção de dependência.

- **Provider**: Gerenciamento de estado para reatividade no app.

## Pré-requisitos

Antes de rodar este projeto, você precisa ter o seguinte instalado em seu sistema:

- [Flutter](https://flutter.dev/docs/get-started/install)

- [Dart](https://dart.dev/get-dart)

- [Android Studio](https://developer.android.com/studio) ou qualquer outro editor de sua preferência.

- [Hive](https://pub.dev/packages/hive) para armazenamento local.

## Como rodar o projeto

1\. **Clone este repositório** para o seu computador:

   ```bash

   git clone https://github.com/seuusuario/to_do_app.git

Navegue para a pasta do projeto:

bash

Copiar código

cd to_do_app

Instale as dependências do Flutter:

bash

Copiar código

flutter pub get

Execute o aplicativo em um emulador Android ou dispositivo físico:

bash

Copiar código

flutter run

Estrutura do Projeto

lib/

main.dart: Arquivo principal que inicializa o app.

todo_list_page.dart: Tela principal do app que exibe as tarefas.

todo_list_controller.dart: Controlador que gerencia a lógica de tarefas.

todo.dart: Modelo que representa uma tarefa.

storage_service.dart: Serviço de armazenamento que usa Hive para persistência de dados.

todo_list_notifier.dart: Notificador para gerenciar o estado das tarefas.

service_locator.dart: Configuração de injeção de dependência com GetIt.

new_todo_widget.dart: Widget para adicionar uma nova tarefa.

Contribuindo

Fork este repositório.

Crie uma nova branch (git checkout -b minha-nova-feature).

Faça suas alterações e commit (git commit -am 'Adicionei uma nova feature').

Push para sua branch (git push origin minha-nova-feature).

Abra um Pull Request.

Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.

markdown

Copiar código

### **Explicação das Seções:**

- **Título** (`#`): O nome do projeto.

- **Funcionalidades** (`-`): Listagem das funcionalidades que o aplicativo oferece.

- **Tecnologias**: Ferramentas e frameworks usados para desenvolver o projeto.

- **Pré-requisitos**: O que precisa ser instalado antes de rodar o projeto.

- **Como rodar o projeto**: Passo a passo para rodar o projeto no ambiente local.

- **Estrutura do Projeto**: Descrição de como os arquivos estão organizados no projeto.

- **Contribuindo**: Passos para contribuir com o repositório.

- **Licença**: Tipo de licença usada no projeto.

## 📇 Créditos

<p align="center">
  Desenvolvido com 💙 por <strong>Cleiton Queiroz</strong>
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/cleitonqueiroz-dev" target="_blank">
    <img src="https://img.shields.io/badge/-LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
  </a>
  <a href="https://github.com/CleitonQ" target="_blank">
    <img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
  </a>
