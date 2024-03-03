# meuGabarito

Aplicativo para criação e acompanhamento de questões de múltipla escolha durante
seções de estudo. Esse app é baseado em um [projeto pessoal anterior construído
com Django](https://github.com/br-adriel/meuGabarito).

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)

![capa](https://github.com/br-adriel/flutter-meu-gabarito/assets/49590887/a7e12e90-8956-4f09-8c83-b32c3516a2e3)

## Motivação

Quando eu estava estudando para o ENEM em 2020, eu costumava resolver as
questões das provas anteriores e depois verificar quantas tinha acertado. Nesse
processo notei que era bem recorrente eu confundir a ordem das respostas ao
corrigir, então criei um projeto em django que me permitisse registrar as
respostas enquanto eu estava fazendo e depois corrigí-las de forma organizada.

Implementei [essa ideia na forma de um website construído com Django](https://github.com/br-adriel/meuGabarito)
em 2021, e em 2024 refiz em forma de aplicativo usando Flutter com Firebase para
o backend com a finalidade de praticar a customização de widgets no Flutter bem
como o funcionamento do Firebase nesse _framework_.

### Não há compatibilidade entre versões

Apesar de serem relativamente parecidas visualmente, as duas implementações não
tem nenhum tipo de interação entre si, contas e gabaritos criadas em uma versão
não podem ser acessadas em outra, visto que o backend das duas não é
compartilhado e nem mesmo seguem a mesma _stack_ de tecnologias.

## Processo de execução

Para executar esse projeto você precisa ter o Flutter instalado em sua máquina e
um projeto do Firebase configurado.

- [Guia oficial de intalação e configuração do Flutter](https://docs.flutter.dev/get-started/install)

### Passos para a configuração do projeto no Firebase

1. Acesse o [console do Firebase](https://console.firebase.google.com/) e clique
no botão `Adicionar projeto`

2. Insira um nome para o seu projeto e clique no botão `Continuar`

3. Desabilite o Google Analytics e aperte no botão `Criar projeto`

4. Aperte no botão continuar

5. Clique no botão circular com a logo do Flutter para registar um app no seu
projeto firebase e siga os passos informados na tela

6. Acesse o menu lateral e habilite o módulo `Authentication` com o provedor
`E-mail/senha` para o seu projeto. Basta seguir os passos mostrados na tela,
deixando a opção `Link do e-mail (login sem senha)` desabilitada.

7. Acesse o menu lateral e habilite o módulo `Firestore Database`, novamente
basta seguir os passos apresentados na tela.

8. Acesse a guia `Regras` das configurações da firestores e substitua o conteúdo
pelo apresentado a seguir:

  ```javascript
  rules_version = '2';

  service cloud.firestore {
    match /databases/{database}/documents {
      match /users/{userId}/{document=**} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
    }
  }
  ```

### Passos para executar o projeto em ambiente de desenvolvimento

Os passos dessa etapa consideram que você está utilizando o [VS Code](https://code.visualstudio.com/)

1. Abra a pasta do projeto no terminal

2. Execute o comando a seguir para instalar as dependências do projeto

    ```bash
    flutter pub get
    ```

3. Abra o projeto no VS Code e instale a [extensão Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

4. Faça uma cópia do arquivo `.env.example` o renomando como `.env`

5. Mova os dados sensíveis do projeto firebase fornecidos durante a criação do
projeto para o arquivo `.env`

6. Abra o projeto no VS Code e vá até a área inferior direita, selecione o
dispositivo em que você deseja executar a aplicação

7. Abra o arquivo `lib/main.dart` e aperte o botão play na área superior direita

### Passos para gerar o APK

- Execute o comando a seguir e aguarde até o processo terminar, o APK estará
disponível na pasta `build/app/outputs/flutter-apk` com o nome `app-release.apk`
  
  ```bash
  flutter build apk
  ```
