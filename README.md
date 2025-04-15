# 🚗 App de Rastreamento de Combustível

Aplicativo desenvolvido em **Flutter** para registrar abastecimentos e calcular a **média de consumo de combustível (km/L)**.

Inspirado visualmente em um app com layout clean e moderno, este projeto exibe:

- 📊 **Média de consumo** (km/L)
- 🧾 **Histórico de abastecimentos**
- ⛽ **Botão para registrar novo abastecimento**
- 💾 Armazenamento local com `SharedPreferences`

---

## 🧰 Tecnologias utilizadas

- Flutter (Dart)
- SharedPreferences (armazenamento local)
- Material Design

---

## 🖼️ Tela principal

- Topo com a **média de consumo** atual do veículo.
- Botão **“Adicionar Combustível”** para registrar novo abastecimento.
- Lista com o **histórico dos últimos abastecimentos** (data, km e litros).
- Visual inspirado em apps modernos, com design amigável.
![image](https://github.com/user-attachments/assets/3cfd3839-6a5b-479f-8841-adea4305b467)
## 🖼️ Tela cadastro
![image](https://github.com/user-attachments/assets/8fa9fbb2-f75e-4902-a720-0c46f660a361)

---

## 🚀 Como instalar e rodar o app

> Pré-requisitos:
> - Flutter instalado (https://flutter.dev/docs/get-started/install)
> - Android Studio ou VSCode configurado com Flutter/Dart

### Passo a passo:

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/app-combustivel.git

# Acesse o diretório do projeto
cd app-combustivel

# Instale as dependências
flutter pub get

# Execute o projeto em um emulador ou dispositivo físico
flutter run
