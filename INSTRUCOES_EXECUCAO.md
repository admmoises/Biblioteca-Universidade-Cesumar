# 📋 Instruções de Execução - Sistema Biblioteca Cesumar

## ⚠️ Pré-requisitos Necessários

Para executar este sistema, você precisa instalar:

### 1. **Java JDK 11+**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install openjdk-11-jdk

# Verificar instalação
java -version
```

### 2. **Maven 3.6+**
```bash
# Ubuntu/Debian
sudo apt install maven

# Verificar instalação
mvn -version
```

### 3. **Servidor de Aplicação** (escolha um)

#### Opção A: Tomcat 9
```bash
# Download do Tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.tar.gz
tar -xvzf apache-tomcat-9.0.82.tar.gz
cd apache-tomcat-9.0.82/bin
./startup.sh
```

#### Opção B: Usar Jetty embutido (mais fácil)
```bash
# Já configurado no pom.xml
mvn jetty:run
```

## 🚀 Como Executar o Sistema

### Método 1: Com Maven e Jetty (Recomendado)
```bash
cd "~/WorkSpaces/Biblioteca Universidade Cesumar"
mvn clean compile
mvn jetty:run
# Acesse: http://localhost:8080
```

### Método 2: Gerar WAR para Tomcat
```bash
cd "~/WorkSpaces/Biblioteca Universidade Cesumar"
mvn clean package
# Copie target/biblioteca-cesumar.war para webapps do Tomcat
cp target/biblioteca-cesumar.war /path/to/tomcat/webapps/
# Acesse: http://localhost:8080/biblioteca-cesumar
```

### Método 3: Compilação Manual (sem Maven)
```bash
# Criar estrutura de diretórios
mkdir -p build/WEB-INF/classes

# Compilar classes Java
javac -cp "lib/*" -d build/WEB-INF/classes \
  src/main/java/br/com/biblioteca/model/*.java \
  src/main/java/br/com/biblioteca/controller/*.java

# Copiar arquivos web
cp -r src/main/webapp/* build/
cp pom.xml build/

# Criar WAR manualmente
cd build
jar -cvf ../biblioteca-cesumar.war *
```

## 🐳 Alternativa: Docker (Sem instalação local)

Crie um arquivo `Dockerfile`:

```dockerfile
FROM tomcat:9-jdk11
COPY target/biblioteca-cesumar.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
```

Execute:
```bash
mvn clean package
docker build -t biblioteca-cesumar .
docker run -p 8080:8080 biblioteca-cesumar
```

## 📦 Instalação Rápida no WSL

Como você está usando WSL (detectado pelo kernel), aqui está um script completo:

```bash
#!/bin/bash
# Script de instalação completa

# Atualizar sistema
sudo apt update

# Instalar Java 11
sudo apt install -y openjdk-11-jdk

# Instalar Maven
sudo apt install -y maven

# Verificar instalações
echo "=== Verificando instalações ==="
java -version
mvn -version

# Compilar e executar projeto
cd ~/WorkSpaces/Biblioteca\ Universidade\ Cesumar
mvn clean compile
mvn jetty:run
```

Salve como `instalar.sh` e execute:
```bash
chmod +x instalar.sh
./instalar.sh
```

## 🔧 Resolução de Problemas

### Erro: "mvn: command not found"
1. Instale o Maven conforme instruções acima
2. Ou adicione ao PATH: `export PATH=$PATH:/path/to/maven/bin`

### Erro: "java: command not found"
1. Instale o JDK conforme instruções acima
2. Configure JAVA_HOME: `export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64`

### Porta 8080 já em uso
```bash
# Verificar processo usando a porta
sudo lsof -i :8080
# Ou mude a porta no pom.xml
```

## 🎯 Acesso ao Sistema

Após executar com sucesso:
- **URL Local**: http://localhost:8080
- **URL Rede**: http://[seu-ip]:8080

### Páginas disponíveis:
- `/` - Página inicial
- `/cadastro.jsp` - Cadastrar livros
- `/livros?action=listar` - Listar livros
- `/listagem.xhtml` - Listagem JSF

## 💡 Dica para Desenvolvimento

Use o modo de desenvolvimento do Jetty para hot-reload:
```xml
<!-- No pom.xml já está configurado -->
<scanIntervalSeconds>10</scanIntervalSeconds>
```

## 📱 Testar sem Servidor

Para apenas visualizar as páginas (sem funcionalidades backend):
```bash
# Servidor HTTP simples com Python
cd src/main/webapp
python3 -m http.server 8000
# Acesse: http://localhost:8000
```

**Nota**: Sem servidor Java, apenas o HTML/CSS será visível, as funcionalidades de cadastro/listagem não funcionarão.