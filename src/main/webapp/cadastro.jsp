<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Livro - Biblioteca Cesumar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .navbar-brand {
            font-weight: bold;
            color: white !important;
        }
        
        .navbar-nav .nav-link {
            color: white !important;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        
        .navbar-nav .nav-link:hover {
            color: #ffd700 !important;
        }
        
        .main-content {
            padding: 120px 0 60px 0;
        }
        
        .form-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px;
            color: white;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
            color: #ffd700;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: white;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 12px 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #ffd700;
            box-shadow: 0 0 0 0.2rem rgba(255, 215, 0, 0.25);
            color: white;
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #ffd700, #ff6b6b);
            border: none;
            padding: 12px 30px;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 25px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 215, 0, 0.4);
            background: linear-gradient(45deg, #ff6b6b, #ffd700);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 12px 30px;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 25px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            color: white;
        }
        
        .alert {
            border-radius: 10px;
            margin-bottom: 25px;
        }
        
        .alert-danger {
            background: rgba(220, 53, 69, 0.2);
            border: 1px solid rgba(220, 53, 69, 0.3);
            color: #ff6b6b;
        }
        
        .alert-success {
            background: rgba(25, 135, 84, 0.2);
            border: 1px solid rgba(25, 135, 84, 0.3);
            color: #4caf50;
        }
        
        .form-text {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
            margin-top: 5px;
        }
        
        .required {
            color: #ff6b6b;
        }
        
        .form-control.is-invalid {
            border-color: #ff6b6b;
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.25);
        }
        
        .form-control.is-valid {
            border-color: #4caf50;
            box-shadow: 0 0 0 0.2rem rgba(76, 175, 80, 0.25);
        }
        
        .invalid-feedback {
            color: #ff6b6b;
            font-size: 0.875rem;
            margin-top: 5px;
        }
        
        .valid-feedback {
            color: #4caf50;
            font-size: 0.875rem;
            margin-top: 5px;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }
        
        .fade-in {
            animation: fadeIn 0.8s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .loading {
            display: none;
            text-align: center;
            margin-top: 20px;
        }
        
        .spinner-border {
            color: #ffd700;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-book-open me-2"></i>
                Biblioteca Cesumar
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Início</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="cadastro.jsp">Cadastrar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="livros?action=listar">Consultar</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="form-container fade-in">
                        <h2>
                            <i class="fas fa-plus-circle me-2"></i>
                            Cadastrar Novo Livro
                        </h2>
                        
                        <!-- Mensagens de erro -->
                        <c:if test="${not empty erro}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                ${erro}
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty erros}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                <strong>Foram encontrados os seguintes erros:</strong>
                                <ul class="mt-2 mb-0">
                                    <c:forEach var="erro" items="${erros}">
                                        <li>${erro}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty sucesso}">
                            <div class="alert alert-success" role="alert">
                                <i class="fas fa-check-circle me-2"></i>
                                ${sucesso}
                            </div>
                        </c:if>
                        
                        <form id="cadastroForm" action="livros" method="post" novalidate>
                            <input type="hidden" name="action" value="cadastrar">
                            
                            <!-- Título -->
                            <div class="form-group">
                                <label for="titulo" class="form-label">
                                    Título <span class="required">*</span>
                                </label>
                                <input type="text" 
                                       class="form-control" 
                                       id="titulo" 
                                       name="titulo" 
                                       placeholder="Digite o título do livro"
                                       value="${titulo}"
                                       required
                                       maxlength="200">
                                <div class="form-text">Máximo 200 caracteres</div>
                                <div class="invalid-feedback"></div>
                                <div class="valid-feedback">Título válido!</div>
                            </div>
                            
                            <!-- Autor -->
                            <div class="form-group">
                                <label for="autor" class="form-label">
                                    Autor <span class="required">*</span>
                                </label>
                                <input type="text" 
                                       class="form-control" 
                                       id="autor" 
                                       name="autor" 
                                       placeholder="Digite o nome do autor"
                                       value="${autor}"
                                       required
                                       maxlength="100">
                                <div class="form-text">Máximo 100 caracteres</div>
                                <div class="invalid-feedback"></div>
                                <div class="valid-feedback">Autor válido!</div>
                            </div>
                            
                            <!-- Ano de Publicação -->
                            <div class="form-group">
                                <label for="ano" class="form-label">
                                    Ano de Publicação <span class="required">*</span>
                                </label>
                                <input type="number" 
                                       class="form-control" 
                                       id="ano" 
                                       name="ano" 
                                       placeholder="Digite o ano de publicação"
                                       value="${ano}"
                                       required
                                       min="1000"
                                       max="2100">
                                <div class="form-text">Entre 1000 e 2100</div>
                                <div class="invalid-feedback"></div>
                                <div class="valid-feedback">Ano válido!</div>
                            </div>
                            
                            <!-- ISBN -->
                            <div class="form-group">
                                <label for="isbn" class="form-label">
                                    ISBN <span class="required">*</span>
                                </label>
                                <input type="text" 
                                       class="form-control" 
                                       id="isbn" 
                                       name="isbn" 
                                       placeholder="Digite o ISBN (ex: 978-3-16-148410-0)"
                                       value="${isbn}"
                                       required
                                       maxlength="17">
                                <div class="form-text">ISBN-10 ou ISBN-13 (com ou sem hífens)</div>
                                <div class="invalid-feedback"></div>
                                <div class="valid-feedback">ISBN válido!</div>
                            </div>
                            
                            <!-- Botões -->
                            <div class="button-group">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>
                                    Cadastrar
                                </button>
                                <button type="button" class="btn btn-secondary" onclick="limparFormulario()">
                                    <i class="fas fa-eraser me-2"></i>
                                    Limpar
                                </button>
                                <a href="index.jsp" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-2"></i>
                                    Voltar
                                </a>
                            </div>
                            
                            <div class="loading">
                                <div class="spinner-border" role="status">
                                    <span class="visually-hidden">Carregando...</span>
                                </div>
                                <p class="mt-2">Processando...</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validação do formulário
        const BibliotecaForm = {
            validarTitulo: function(titulo) {
                if (!titulo || titulo.trim().length === 0) {
                    return 'Título é obrigatório';
                }
                if (titulo.length > 200) {
                    return 'Título não pode ter mais de 200 caracteres';
                }
                return null;
            },
            
            validarAutor: function(autor) {
                if (!autor || autor.trim().length === 0) {
                    return 'Autor é obrigatório';
                }
                if (autor.length > 100) {
                    return 'Autor não pode ter mais de 100 caracteres';
                }
                return null;
            },
            
            validarAno: function(ano) {
                if (!ano || ano.trim().length === 0) {
                    return 'Ano é obrigatório';
                }
                const anoNum = parseInt(ano);
                if (isNaN(anoNum) || anoNum < 1000 || anoNum > 2100) {
                    return 'Ano deve ser um número entre 1000 e 2100';
                }
                return null;
            },
            
            validarISBN: function(isbn) {
                if (!isbn || isbn.trim().length === 0) {
                    return 'ISBN é obrigatório';
                }
                
                // Remove hífens e espaços
                const isbnLimpo = isbn.replace(/[-\s]/g, '');
                
                if (isbnLimpo.length !== 10 && isbnLimpo.length !== 13) {
                    return 'ISBN deve ter 10 ou 13 dígitos';
                }
                
                // Verifica se contém apenas números e X (para ISBN-10)
                if (!/^[0-9X]+$/i.test(isbnLimpo)) {
                    return 'ISBN deve conter apenas números e, opcionalmente, X no final';
                }
                
                return null;
            },
            
            validarCampo: function(campo) {
                const input = document.getElementById(campo);
                const valor = input.value;
                let erro = null;
                
                switch(campo) {
                    case 'titulo':
                        erro = this.validarTitulo(valor);
                        break;
                    case 'autor':
                        erro = this.validarAutor(valor);
                        break;
                    case 'ano':
                        erro = this.validarAno(valor);
                        break;
                    case 'isbn':
                        erro = this.validarISBN(valor);
                        break;
                }
                
                const feedback = input.parentElement.querySelector('.invalid-feedback');
                
                if (erro) {
                    input.classList.add('is-invalid');
                    input.classList.remove('is-valid');
                    feedback.textContent = erro;
                } else {
                    input.classList.remove('is-invalid');
                    input.classList.add('is-valid');
                }
                
                return erro === null;
            },
            
            formatarISBN: function(isbn) {
                const isbnLimpo = isbn.replace(/[-\s]/g, '');
                
                if (isbnLimpo.length === 10) {
                    return isbnLimpo.substring(0, 1) + '-' +
                           isbnLimpo.substring(1, 4) + '-' +
                           isbnLimpo.substring(4, 9) + '-' +
                           isbnLimpo.substring(9, 10);
                } else if (isbnLimpo.length === 13) {
                    return isbnLimpo.substring(0, 3) + '-' +
                           isbnLimpo.substring(3, 4) + '-' +
                           isbnLimpo.substring(4, 7) + '-' +
                           isbnLimpo.substring(7, 12) + '-' +
                           isbnLimpo.substring(12, 13);
                }
                
                return isbn;
            }
        };
        
        // Event listeners
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('cadastroForm');
            const campos = ['titulo', 'autor', 'ano', 'isbn'];
            
            // Validação em tempo real
            campos.forEach(campo => {
                const input = document.getElementById(campo);
                input.addEventListener('blur', () => BibliotecaForm.validarCampo(campo));
                input.addEventListener('input', () => {
                    // Remove classes de validação durante a digitação
                    input.classList.remove('is-invalid', 'is-valid');
                });
            });
            
            // Formatação automática do ISBN
            document.getElementById('isbn').addEventListener('blur', function() {
                if (this.value && BibliotecaForm.validarCampo('isbn')) {
                    this.value = BibliotecaForm.formatarISBN(this.value);
                }
            });
            
            // Validação no submit
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                let formValido = true;
                campos.forEach(campo => {
                    if (!BibliotecaForm.validarCampo(campo)) {
                        formValido = false;
                    }
                });
                
                if (formValido) {
                    // Mostra loading
                    document.querySelector('.loading').style.display = 'block';
                    
                    // Desabilita o botão de submit
                    const submitBtn = form.querySelector('button[type="submit"]');
                    submitBtn.disabled = true;
                    
                    // Submete o formulário
                    form.submit();
                } else {
                    // Foca no primeiro campo com erro
                    const primeiroErro = form.querySelector('.is-invalid');
                    if (primeiroErro) {
                        primeiroErro.focus();
                    }
                }
            });
        });
        
        // Função para limpar o formulário
        function limparFormulario() {
            const form = document.getElementById('cadastroForm');
            form.reset();
            
            // Remove classes de validação
            const inputs = form.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.classList.remove('is-invalid', 'is-valid');
            });
            
            // Foca no primeiro campo
            document.getElementById('titulo').focus();
        }
        
        // Auto-focus no primeiro campo
        document.getElementById('titulo').focus();
    </script>
</body>
</html>