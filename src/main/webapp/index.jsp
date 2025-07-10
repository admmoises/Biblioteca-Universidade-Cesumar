<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Biblioteca - Universidade Cesumar</title>
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
        
        .hero-section {
            padding: 80px 0;
            text-align: center;
            color: white;
        }
        
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .hero-section p {
            font-size: 1.3rem;
            margin-bottom: 40px;
            opacity: 0.9;
        }
        
        .stats-section {
            padding: 60px 0;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .stat-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #ffd700;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .features-section {
            padding: 80px 0;
            background: rgba(255, 255, 255, 0.05);
        }
        
        .feature-card {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            color: white;
            height: 100%;
            transition: all 0.3s ease;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
        }
        
        .feature-icon {
            font-size: 4rem;
            margin-bottom: 25px;
            color: #ffd700;
        }
        
        .feature-card h3 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            font-weight: bold;
        }
        
        .feature-card p {
            font-size: 1.1rem;
            opacity: 0.9;
            line-height: 1.6;
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
        
        .footer {
            background: rgba(0, 0, 0, 0.3);
            color: white;
            padding: 40px 0;
            text-align: center;
        }
        
        .footer h5 {
            color: #ffd700;
            margin-bottom: 20px;
        }
        
        .footer p {
            opacity: 0.8;
            margin-bottom: 10px;
        }
        
        .resources-section {
            padding: 60px 0;
            background: rgba(255, 255, 255, 0.08);
        }
        
        .resource-card {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            color: white;
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .resource-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .resource-icon {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #ffd700;
        }
        
        .fade-in {
            animation: fadeIn 1s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-book-open me-2"></i>
                Biblioteca Cesumar
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#home">Início</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cadastro.jsp">Cadastrar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="livros?action=listar">Consultar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#sobre">Sobre</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero-section fade-in">
        <div class="container">
            <h1>Sistema de Biblioteca</h1>
            <p>Universidade Cesumar - Gestão Moderna do Acervo</p>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <p class="lead">
                        Bem-vindo ao sistema de gestão de biblioteca da Universidade Cesumar. 
                        Uma solução moderna e eficiente para o controle do acervo acadêmico.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="stat-number">
                            <c:choose>
                                <c:when test="${not empty totalLivros}">
                                    ${totalLivros}
                                </c:when>
                                <c:otherwise>
                                    0
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <h5>Total de Livros</h5>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                        <div class="stat-number">0</div>
                        <h5>Usuários Ativos</h5>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-book-reader"></i>
                        </div>
                        <div class="stat-number">0</div>
                        <h5>Empréstimos Ativos</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="text-white mb-4">Funcionalidades Principais</h2>
                    <p class="text-white-50 lead">Gerencie seu acervo com eficiência e praticidade</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-plus-circle"></i>
                        </div>
                        <h3>Cadastrar Livros</h3>
                        <p>Adicione novos livros ao acervo com informações completas: título, autor, ano de publicação e ISBN.</p>
                        <a href="cadastro.jsp" class="btn btn-primary mt-3">
                            <i class="fas fa-plus me-2"></i>Cadastrar Agora
                        </a>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h3>Consultar Acervo</h3>
                        <p>Visualize, pesquise e gerencie todos os livros cadastrados no sistema com interface intuitiva.</p>
                        <a href="livros?action=listar" class="btn btn-primary mt-3">
                            <i class="fas fa-search me-2"></i>Consultar Agora
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Resources Section -->
    <section class="resources-section">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="text-white mb-4">Recursos Adicionais</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="resource-card">
                        <div class="resource-icon">
                            <i class="fas fa-chart-bar"></i>
                        </div>
                        <h5>Relatórios</h5>
                        <p>Gere relatórios detalhados sobre o acervo e estatísticas de utilização.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="resource-card">
                        <div class="resource-icon">
                            <i class="fas fa-cog"></i>
                        </div>
                        <h5>Configurações</h5>
                        <p>Personalize o sistema conforme as necessidades da sua biblioteca.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="resource-card">
                        <div class="resource-icon">
                            <i class="fas fa-life-ring"></i>
                        </div>
                        <h5>Suporte</h5>
                        <p>Acesse nossa central de ajuda e suporte técnico especializado.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="sobre" class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Biblioteca Universidade Cesumar</h5>
                    <p>Sistema de gestão de acervo desenvolvido para facilitar o controle e organização dos livros.</p>
                    <p>© 2024 Universidade Cesumar. Todos os direitos reservados.</p>
                </div>
                <div class="col-md-6">
                    <h5>Contato</h5>
                    <p><i class="fas fa-envelope me-2"></i>biblioteca@cesumar.br</p>
                    <p><i class="fas fa-phone me-2"></i>(44) 3027-6360</p>
                    <p><i class="fas fa-map-marker-alt me-2"></i>Av. Guedner, 1610 - Maringá, PR</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Atualiza estatísticas dinamicamente
        document.addEventListener('DOMContentLoaded', function() {
            // Smooth scrolling para links internos
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
        });
    </script>
</body>
</html>