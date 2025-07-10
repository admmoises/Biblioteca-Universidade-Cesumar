# Sistema de Biblioteca - Universidade Cesumar

## 📚 Descrição

Sistema web desenvolvido em Java para gerenciamento do acervo da biblioteca da Universidade Cesumar. O sistema permite cadastrar, listar e excluir livros, seguindo os padrões MVC (Model-View-Controller) e utilizando tecnologias Java EE.

## 🎯 Objetivos

- Modernizar o controle do acervo bibliográfico
- Substituir planilhas manuais por sistema digital
- Facilitar o acesso remoto às informações
- Implementar interface amigável e funcional

## ⚡ Funcionalidades

### ✅ Implementadas
- **Cadastro de livros** com validação completa
  - Título (obrigatório, máx. 200 caracteres)
  - Autor (obrigatório, máx. 100 caracteres)
  - Ano de publicação (1000-2100)
  - ISBN (formato válido com dígito verificador)

- **Listagem de livros** com interface responsiva
  - Visualização em tabela
  - Busca por título ou autor
  - Filtros dinâmicos
  - Modal para detalhes

- **Exclusão de livros** com confirmação
  - Confirmação visual com SweetAlert2
  - Validação de segurança

### 🔧 Recursos Técnicos
- Validação client-side e server-side
- Tratamento robusto de erros
- Interface responsiva (Bootstrap 5)
- Armazenamento em memória (thread-safe)
- Navegação consistente

## 🏗️ Arquitetura

### Padrão MVC
```
src/
├── main/
│   ├── java/br/com/biblioteca/
│   │   ├── model/           # Camada Model
│   │   │   ├── Livro.java
│   │   │   ├── BibliotecaDAO.java
│   │   │   └── ValidadorLivro.java
│   │   ├── controller/      # Camada Controller
│   │   │   ├── LivroServlet.java
│   │   │   └── IndexBean.java      # Managed Bean JSF
│   │   └── filter/
│   │       └── CharacterEncodingFilter.java
│   └── webapp/              # Camada View
│       ├── index.jsp        # Página inicial (JSP)
│       ├── index.xhtml      # Página inicial (JSF)
│       ├── cadastro.jsp     # Cadastro (JSP)
│       ├── listagem.jsp     # Listagem (JSP)
│       ├── erro.jsp         # Tratamento de erros
│       └── WEB-INF/
│           ├── web.xml
│           └── faces-config.xml
```

### Tecnologias Utilizadas
- **Backend**: Java 11, Servlets 4.0, JSP 2.2, JSF 2.2
- **Frontend**: Bootstrap 5.3, Font Awesome 6, SweetAlert2
- **Build**: Maven 3.8+
- **Servidor**: Tomcat 9+ ou Jetty 9+

## 🚀 Como Executar

### Pré-requisitos
- Java 11+
- Maven 3.6+
- Servidor de aplicação (Tomcat 9+ ou Jetty)

### Instalação

1. **Clone ou extraia o projeto**
```bash
cd "Biblioteca Universidade Cesumar"
```

2. **Compile o projeto**
```bash
mvn clean compile
```

3. **Execute com Jetty (desenvolvimento)**
```bash
mvn jetty:run
```

4. **Ou gere WAR para Tomcat**
```bash
mvn clean package
# Deploy do arquivo target/biblioteca-cesumar.war no Tomcat
```

### Acesso
- **URL Principal**: http://localhost:8080
- **Página JSP**: http://localhost:8080/index.jsp
- **Página JSF**: http://localhost:8080/index.xhtml

## 📱 Interfaces

### 1. Página Inicial (`index.jsp` e `index.xhtml`)
- Dashboard com estatísticas
- Navegação principal
- Links para funcionalidades
- Design moderno com gradientes
- **Versão JSF disponível**: `index.xhtml` com Managed Bean

### 2. Cadastro de Livros (`cadastro.jsp`)
- Formulário com validação em tempo real
- Sanitização automática de dados
- Formatação de ISBN
- Feedback visual de erros/sucesso

### 3. Listagem de Livros (`listagem.jsp`)
- Tabela responsiva com todos os livros
- Sistema de busca avançado
- Modal para visualização de detalhes
- Confirmação de exclusão

### 4. Página de Erro (`erro.jsp`)
- Tratamento personalizado por tipo de erro
- Sugestões contextuais
- Informações de contato
- Detalhes técnicos (desenvolvimento)

## 🔒 Validações Implementadas

### ISBN
- Suporte a ISBN-10 e ISBN-13
- Validação de dígito verificador
- Normalização automática
- Formatação com hífens

### Campos Obrigatórios
- Todos os campos são validados
- Mensagens específicas de erro
- Sanitização de texto
- Prevenção de duplicatas

## 🎨 Design e UX

### Identidade Visual
- **Cores**: Gradiente roxo/azul (#667eea → #764ba2)
- **Tipografia**: Segoe UI (moderna e limpa)
- **Ícones**: Font Awesome 6.0
- **Layout**: Bootstrap 5.3 (responsivo)

### Experiência do Usuário
- Animações suaves (CSS transitions)
- Feedback visual em tempo real
- Loading states
- Navegação intuitiva
- Design responsivo

## 📊 Funcionalidades Futuras

### Próximas Implementações
- [ ] Sistema de empréstimos
- [ ] Gestão de usuários
- [ ] Relatórios e estatísticas
- [ ] Integração com banco de dados
- [ ] API REST
- [ ] Sistema de notificações

### Melhorias Técnicas
- [ ] Testes unitários (JUnit)
- [ ] Integração contínua
- [ ] Logs estruturados
- [ ] Cache distribuído
- [ ] Segurança avançada

## 🐛 Resolução de Problemas

### Problemas Comuns

**1. Erro 404 ao acessar páginas**
- Verifique se o servidor está rodando
- Confirme o contexto da aplicação
- Verifique os mapeamentos no web.xml

**2. Erro de compilação**
- Confirme Java 11+ instalado
- Execute `mvn clean compile`
- Verifique dependências no pom.xml

**3. Problemas de encoding**
- Sistema configurado para UTF-8
- Filtro de encoding no web.xml
- Verifique configuração do servidor

### Logs e Debug
- Logs disponíveis no console do servidor
- Detalhes técnicos na página de erro
- Stack traces em modo desenvolvimento

## 👥 Equipe de Desenvolvimento

**Desenvolvedor Júnior**: Sistema desenvolvido como solução para modernização da biblioteca da Universidade Cesumar.

## 📞 Suporte

**Biblioteca Universidade Cesumar**
- 📧 Email: biblioteca@cesumar.br
- 📞 Telefone: (44) 3027-6360
- 🕒 Horário: 08:00 às 18:00
- 📍 Endereço: Av. Guedner, 1610 - Maringá, PR

## 📄 Licença

Sistema desenvolvido para uso acadêmico na Universidade Cesumar.
© 2024 Universidade Cesumar. Todos os direitos reservados.

---

## 🔍 Checklist de Entrega

### ✅ Funcionalidades
- [x] Cadastro de livros com Título, Autor, Ano e ISBN
- [x] Listagem dos livros cadastrados
- [x] Exclusão de livros
- [x] Interfaces web desenvolvidas com JSP e JSF
- [x] Tratamento de entradas inválidas

### ✅ Organização do Projeto
- [x] Projeto estruturado em pacotes: model, controller, view
- [x] Separação clara entre lógica e apresentação
- [x] Código comentado e de fácil leitura
- [x] Uso adequado de Servlets para controle das ações
- [x] Utilização de JSF em pelo menos uma das interfaces

### ✅ Requisitos Técnicos
- [x] Servlets para controlar requisições
- [x] JSP e JSF para interface do usuário
- [x] Estrutura baseada no padrão MVC
- [x] Código autoral desenvolvido do zero
- [x] Tratamento de erros comuns

**Status**: ✅ **PROJETO COMPLETO E FUNCIONAL**