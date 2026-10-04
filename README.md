# AWS re/Start — Laboratório 229: Usuários e Grupos

Laboratório **229 — Usuários e Grupos**, realizado durante o programa **AWS re/Start**.

Neste laboratório foram praticados conceitos de gerenciamento de usuários e grupos em um sistema Linux, incluindo criação de usuários, definição de senhas, criação de grupos, associação de usuários a grupos, troca de usuário e utilização do `sudo`.

## Objetivos

* Criar novos usuários no Linux.
* Definir senhas iniciais para os usuários.
* Criar grupos.
* Associar usuários aos grupos apropriados.
* Consultar usuários e grupos existentes no sistema.
* Fazer login utilizando diferentes usuários.
* Compreender o funcionamento básico do `sudo`.
* Verificar registros de tentativas de utilização do `sudo`.

## Ambiente utilizado

* **Plataforma:** Vocareum
* **Serviço:** Amazon EC2
* **Sistema operacional:** Amazon Linux
* **Acesso:** SSH
* **Cliente SSH:** PuTTY
* **Sistema local:** Windows
* **Chave utilizada:** `labsuser.ppk`
* **Usuário inicial:** `ec2-user`
* **Porta SSH:** `22`

> A chave privada `.ppk` não faz parte deste repositório e nunca deve ser enviada para o GitHub.

---

# 1. Iniciar o laboratório

O laboratório foi iniciado através do ambiente Vocareum.

Após o status do laboratório ficar como **Ready**, foi acessado o AWS Management Console disponibilizado pelo ambiente.

No painel **Details**, foram obtidas as informações necessárias para a conexão:

* **PublicIP** da instância;
* opção **Download PPK** para obter a chave `labsuser.ppk`.

---

# 2. Conectar à instância utilizando PuTTY

Como o ambiente local utilizado foi Windows, a conexão SSH foi realizada utilizando o **PuTTY**.

A sessão foi configurada com:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave privada foi configurada em:

```text
Connection
└── SSH
    └── Auth
        └── Credentials
```

Foi selecionado:

```text
labsuser.ppk
```

Após iniciar a conexão, foi aceita a mensagem de segurança apresentada pelo PuTTY na primeira conexão.

O usuário utilizado foi:

```text
ec2-user
```

---

# 3. Criar usuários

O primeiro passo do gerenciamento de usuários foi verificar o diretório atual:

```bash
pwd
```

O resultado esperado é:

```text
/home/ec2-user
```

Em seguida, foi criado o primeiro usuário:

```bash
sudo useradd arosalez
```

Esse comando cria o usuário `arosalez`.

Depois, foi definida a senha:

```bash
sudo passwd arosalez
```

A senha inicial utilizada no laboratório foi:

```text
P@ssword1234!
```

Durante a digitação da senha, nenhum caractere é exibido no terminal. Isso é um comportamento normal do Linux.

---

# 4. Usuários criados

Seguindo a tabela fornecida pelo laboratório, foram criados os seguintes usuários:

| Nome              | ID do usuário | Função                  |
| ----------------- | ------------- | ----------------------- |
| Alejandro Rosalez | `arosalez`    | Gerente de Vendas       |
| Efua Owusu        | `eowusu`      | Expedição               |
| Jane Doe          | `jdoe`        | Expedição               |
| Li Juan           | `ljuan`       | Gerente de RH           |
| Mary Major        | `mmajor`      | Gerente Financeiro      |
| Mateo Jackson     | `mjackson`    | CEO                     |
| Nikki Wolf        | `nwolf`       | Representante de Vendas |
| Paulo Santos      | `psantos`     | Expedição               |
| Sofia Martinez    | `smartinez`   | Especialista de RH      |
| Saanvi Sarkar     | `ssarkar`     | Especialista Financeiro |

A criação dos demais usuários foi feita utilizando:

```bash
sudo useradd <ID_DO_USUARIO>
```

e:

```bash
sudo passwd <ID_DO_USUARIO>
```

---

# 5. Verificar os usuários existentes

Para visualizar os usuários registrados no sistema, foi utilizado:

```bash
sudo cat /etc/passwd | cut -d: -f1
```

O arquivo `/etc/passwd` contém informações dos usuários do sistema.

O comando utiliza `cat` para visualizar o arquivo e `cut` para selecionar apenas a primeira coluna, que contém os nomes dos usuários.

Entre os usuários criados devem aparecer:

```text
arosalez
eowusu
jdoe
ljuan
mmajor
mjackson
nwolf
psantos
smartinez
ssarkar
```

---

# 6. Criar grupos

Depois da criação dos usuários, foram criados grupos para organizar os usuários de acordo com suas funções.

Os grupos utilizados no laboratório foram:

* `Sales`
* `HR`
* `Finance`
* `Shipping`
* `Managers`
* `CEO`

O comando utilizado para criar um grupo é:

```bash
sudo groupadd <grupo>
```

Por exemplo:

```bash
sudo groupadd Sales
```

Os demais grupos foram criados utilizando o mesmo procedimento.

---

# 7. Verificar os grupos

Para visualizar os grupos existentes no sistema:

```bash
cat /etc/group
```

Esse arquivo contém informações sobre os grupos existentes no Linux.

Após a criação, os grupos utilizados no laboratório devem aparecer na lista:

```text
Sales
HR
Finance
Shipping
Managers
CEO
```

---

# 8. Associar usuários aos grupos

Para adicionar um usuário a um grupo foi utilizado:

```bash
sudo usermod -a -G <Grupo> <Usuário>
```

Por exemplo, para adicionar `arosalez` ao grupo `Sales`:

```bash
sudo usermod -a -G Sales arosalez
```

A opção `-G` define grupos suplementares e a opção `-a` adiciona o usuário ao grupo sem remover suas associações existentes.

## Organização dos grupos

### Sales

```text
arosalez
nwolf
ec2-user
```

### HR

```text
ljuan
smartinez
ec2-user
```

### Finance

```text
mmajor
ssarkar
ec2-user
```

### Shipping

```text
eowusu
jdoe
psantos
ec2-user
```

### Managers

```text
arosalez
ljuan
mmajor
ec2-user
```

### CEO

```text
mjackson
ec2-user
```

O usuário `ec2-user` foi adicionado a todos os grupos, conforme solicitado pelo laboratório.

---

# 9. Verificar as associações

Para verificar os grupos e os usuários associados:

```bash
sudo cat /etc/group
```

Os grupos devem apresentar os usuários correspondentes.

Por exemplo:

```text
Sales:x:...:arosalez,nwolf,ec2-user
HR:x:...:ljuan,smartinez,ec2-user
Finance:x:...:mmajor,ssarkar,ec2-user
Shipping:x:...:eowusu,jdoe,psantos,ec2-user
Managers:x:...:arosalez,ljuan,mmajor,ec2-user
CEO:x:...:mjackson,ec2-user
```

Os números dos grupos podem variar dependendo do ambiente. O importante é verificar os nomes e as associações.

---

# 10. Fazer login como outro usuário

Depois de criar e configurar os usuários, foi testada a troca de usuário utilizando:

```bash
su arosalez
```

Foi informada a senha definida anteriormente.

Após a autenticação, o terminal passa a representar o usuário `arosalez`.

Para confirmar o diretório atual:

```bash
pwd
```

Nesse momento, o laboratório demonstra que o usuário pode estar no diretório:

```text
/home/ec2-user
```

mesmo tendo mudado para o usuário `arosalez`.

---

# 11. Testar permissões de escrita

Enquanto conectado como `arosalez`, foi utilizado:

```bash
touch myFile.txt
```

A operação resulta em erro de permissão porque `arosalez` não possui permissão para criar arquivos no diretório `/home/ec2-user`.

Isso demonstra que usuários diferentes possuem permissões diferentes no sistema.

---

# 12. Testar o comando sudo

Foi então realizada uma tentativa de executar o mesmo comando com privilégios administrativos:

```bash
sudo touch myFile.txt
```

Como `arosalez` não está autorizado a utilizar `sudo`, o sistema informa que o usuário não está no arquivo de usuários autorizados.

Esse comportamento demonstra que **nem todo usuário possui privilégios administrativos**.

O `sudo` permite executar comandos com privilégios elevados, mas somente usuários autorizados podem utilizá-lo.

---

# 13. Voltar para o usuário anterior

Para sair do usuário `arosalez` e retornar ao usuário anterior:

```bash
exit
```

Após executar o comando, a sessão retorna para:

```text
ec2-user
```

---

# 14. Verificar o registro de segurança

O laboratório também apresentou como as tentativas de utilização do `sudo` são registradas.

Para consultar o arquivo de segurança:

```bash
sudo cat /var/log/secure
```

Nesse arquivo é possível encontrar registros relacionados a tentativas de utilização do `sudo`, incluindo tentativas não autorizadas.

Isso demonstra a importância dos logs para auditoria e investigação de eventos no sistema.

---

# 15. Principais comandos praticados

Durante o laboratório foram utilizados comandos como:

```bash
pwd
sudo useradd
sudo passwd
sudo cat /etc/passwd
cut
sudo groupadd
cat /etc/group
sudo usermod -a -G
su
touch
sudo
exit
sudo cat /var/log/secure
```

---

# 16. O que foi aprendido

Neste laboratório foram praticados conceitos fundamentais de administração de usuários e grupos no Linux:

* criação de usuários;
* definição de senhas;
* consulta de usuários existentes;
* criação de grupos;
* associação de usuários a grupos;
* gerenciamento de grupos suplementares;
* troca de usuário com `su`;
* diferenças de permissões entre usuários;
* utilização do `sudo`;
* identificação de usuários sem privilégios administrativos;
* consulta de logs de segurança;
* organização de usuários de acordo com suas funções.

---

# 17. Conclusão

O laboratório **229 — Usuários e Grupos** permitiu praticar conceitos fundamentais de administração de usuários em um sistema Linux executado em uma instância Amazon EC2.

Foram criados usuários e grupos, realizadas associações de acordo com diferentes funções profissionais e testadas as permissões desses usuários.

Também foi possível observar na prática a diferença entre um usuário comum e um usuário com privilégios administrativos, além de verificar como uma tentativa não autorizada de utilização do `sudo` é registrada nos logs do sistema.

O acesso à instância foi realizado utilizando **SSH através do PuTTY**, com a chave privada `labsuser.ppk`.

---

## Arquivos deste repositório

```text
README.md      → documentação e procedimentos do laboratório
comandos.sh    → comandos praticados, com comentários explicativos
.gitignore     → arquivos que não devem ser enviados ao GitHub
```
