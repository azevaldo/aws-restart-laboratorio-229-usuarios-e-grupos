```bash
#!/bin/bash

# ============================================================
# AWS re/Start - Laboratório 229: Usuários e Grupos
# Comandos praticados durante o laboratório
# ============================================================


# ------------------------------------------------------------
# 1. VERIFICAR O DIRETÓRIO ATUAL
# ------------------------------------------------------------
# O comando "pwd" mostra o caminho do diretório em que
# estamos atualmente.

pwd


# ------------------------------------------------------------
# 2. CRIAR UM USUÁRIO
# ------------------------------------------------------------
# O comando "useradd" cria um novo usuário no sistema.
#
# O "sudo" permite executar o comando com privilégios
# administrativos.

sudo useradd arosalez


# ------------------------------------------------------------
# 3. DEFINIR A SENHA DO USUÁRIO
# ------------------------------------------------------------
# O comando "passwd" permite definir ou alterar a senha
# de um usuário.

sudo passwd arosalez

# A senha utilizada no laboratório foi:
#
# P@ssword1234!
#
# A senha não deve ser armazenada neste arquivo em um
# ambiente real.


# ------------------------------------------------------------
# 4. CRIAR OS DEMAIS USUÁRIOS
# ------------------------------------------------------------
# O mesmo procedimento foi utilizado para criar os demais
# usuários do laboratório.

sudo useradd eowusu
sudo useradd jdoe
sudo useradd ljuan
sudo useradd mmajor
sudo useradd mjackson
sudo useradd nwolf
sudo useradd psantos
sudo useradd smartinez
sudo useradd ssarkar


# ------------------------------------------------------------
# 5. DEFINIR AS SENHAS DOS USUÁRIOS
# ------------------------------------------------------------
# O comando "passwd" define a senha de cada usuário.
#
# Essas instruções são executadas individualmente porque
# o comando solicita a senha de forma interativa.

sudo passwd eowusu
sudo passwd jdoe
sudo passwd ljuan
sudo passwd mmajor
sudo passwd mjackson
sudo passwd nwolf
sudo passwd psantos
sudo passwd smartinez
sudo passwd ssarkar


# ------------------------------------------------------------
# 6. LISTAR OS USUÁRIOS DO SISTEMA
# ------------------------------------------------------------
# O arquivo /etc/passwd contém informações dos usuários.
#
# "cat" exibe o conteúdo do arquivo.
# "|" envia a saída do primeiro comando para o próximo.
# "cut -d: -f1" seleciona apenas a primeira coluna,
# que contém o nome do usuário.

sudo cat /etc/passwd | cut -d: -f1


# ------------------------------------------------------------
# 7. CRIAR GRUPOS
# ------------------------------------------------------------
# O comando "groupadd" cria novos grupos no Linux.

sudo groupadd Sales
sudo groupadd HR
sudo groupadd Finance
sudo groupadd Shipping
sudo groupadd Managers
sudo groupadd CEO


# ------------------------------------------------------------
# 8. VERIFICAR OS GRUPOS EXISTENTES
# ------------------------------------------------------------
# O arquivo /etc/group contém informações sobre os grupos
# existentes no sistema.

cat /etc/group


# ------------------------------------------------------------
# 9. ADICIONAR USUÁRIOS AOS GRUPOS
# ------------------------------------------------------------
# O comando "usermod -a -G" adiciona um usuário a um grupo
# suplementar.
#
# -a -> adiciona o grupo sem remover os grupos existentes
# -G -> especifica o grupo suplementar


# Grupo Sales
sudo usermod -a -G Sales arosalez
sudo usermod -a -G Sales nwolf
sudo usermod -a -G Sales ec2-user


# Grupo HR
sudo usermod -a -G HR ljuan
sudo usermod -a -G HR smartinez
sudo usermod -a -G HR ec2-user


# Grupo Finance
sudo usermod -a -G Finance mmajor
sudo usermod -a -G Finance ssarkar
sudo usermod -a -G Finance ec2-user


# Grupo Shipping
sudo usermod -a -G Shipping eowusu
sudo usermod -a -G Shipping jdoe
sudo usermod -a -G Shipping psantos
sudo usermod -a -G Shipping ec2-user


# Grupo Managers
sudo usermod -a -G Managers arosalez
sudo usermod -a -G Managers ljuan
sudo usermod -a -G Managers mmajor
sudo usermod -a -G Managers ec2-user


# Grupo CEO
sudo usermod -a -G CEO mjackson
sudo usermod -a -G CEO ec2-user


# ------------------------------------------------------------
# 10. VERIFICAR OS GRUPOS E SUAS ASSOCIAÇÕES
# ------------------------------------------------------------
# O comando abaixo mostra os grupos e os usuários associados
# a cada grupo.

sudo cat /etc/group


# ------------------------------------------------------------
# 11. TROCAR PARA OUTRO USUÁRIO
# ------------------------------------------------------------
# O comando "su" permite mudar para outro usuário.
#
# Neste laboratório foi utilizado para entrar como arosalez.

su arosalez


# ------------------------------------------------------------
# 12. VERIFICAR O DIRETÓRIO APÓS A TROCA DE USUÁRIO
# ------------------------------------------------------------
# O comando "pwd" mostra o diretório atual.

pwd


# ------------------------------------------------------------
# 13. TESTAR A PERMISSÃO DE CRIAÇÃO DE ARQUIVOS
# ------------------------------------------------------------
# O comando "touch" cria um arquivo vazio.
#
# Como arosalez não possui permissão de escrita no diretório
# /home/ec2-user, a operação deve resultar em erro.

touch myFile.txt


# ------------------------------------------------------------
# 14. TENTAR UTILIZAR SUDO
# ------------------------------------------------------------
# O comando "sudo" tenta executar uma operação com
# privilégios administrativos.
#
# No laboratório, arosalez não está autorizado a utilizar
# sudo, portanto a tentativa gera uma mensagem de erro.

sudo touch myFile.txt


# ------------------------------------------------------------
# 15. RETORNAR AO USUÁRIO ANTERIOR
# ------------------------------------------------------------
# O comando "exit" encerra a sessão do usuário atual e
# retorna para o usuário anterior.

exit


# ------------------------------------------------------------
# 16. CONSULTAR O LOG DE SEGURANÇA
# ------------------------------------------------------------
# O arquivo /var/log/secure registra eventos relacionados
# à autenticação e operações de segurança.
#
# Neste laboratório foi utilizado para verificar o registro
# da tentativa não autorizada de utilizar sudo.

sudo cat /var/log/secure


# ============================================================
# CONEXÃO SSH
# ============================================================

# A conexão deste laboratório foi realizada utilizando:
#
# Cliente: PuTTY
# Sistema local: Windows
# Protocolo: SSH
# Porta: 22
# Usuário: ec2-user
# Chave privada: labsuser.ppk
#
# A chave .ppk foi configurada diretamente no PuTTY.
#
# Portanto, o comando SSH com OpenSSH não foi utilizado
# para realizar a conexão neste laboratório.


# ------------------------------------------------------------
# REFERÊNCIA: CONEXÃO COM OPENSSH
# ------------------------------------------------------------
# Em ambientes Linux/macOS, seria possível utilizar:
#
# ssh -i labsuser.pem ec2-user@<public-ip>
#
# Esse comando é apenas uma referência e não representa
# a forma utilizada neste laboratório.
```
