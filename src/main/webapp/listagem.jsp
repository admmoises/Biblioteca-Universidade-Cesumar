<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Livros - Biblioteca Cesumar</title>
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
        
        .content-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 30px;
            color: white;
            margin-bottom: 30px;
        }
        
        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .page-header h2 {
            font-weight: bold;
            color: #ffd700;
            margin-bottom: 10px;
        }
        
        .stats-row {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            text-align: center;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .stat-icon {
            font-size: 2rem;
            color: #ffd700;
            margin-bottom: 10px;
        }
        
        .stat-number {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .search-section {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .search-form {
            display: flex;
            gap: 15px;
            align-items: end;
            flex-wrap: wrap;
        }
        
        .search-group {
            flex: 1;
            min-width: 200px;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: white;
        }
        
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
        }
        
        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #ffd700;
            box-shadow: 0 0 0 0.2rem rgba(255, 215, 0, 0.25);
            color: white;
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        
        .form-select option {
            background: #333;
            color: white;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #ffd700, #ff6b6b);
            border: none;
            padding: 10px 20px;
            font-weight: bold;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.4);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 10px 20px;
            font-weight: bold;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.3);
            color: white;
        }
        
        .table-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            overflow-x: auto;
        }
        
        .table {
            color: white;
            margin-bottom: 0;
        }
        
        .table th {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.2);
            color: #ffd700;
            font-weight: bold;
            text-align: center;
        }
        
        .table td {
            border-color: rgba(255, 255, 255, 0.1);
            vertical-align: middle;
        }
        
        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        
        .badge {
            font-size: 0.8rem;
            padding: 5px 10px;
        }
        
        .badge-disponivel {
            background: #4caf50;
            color: white;
        }
        
        .btn-sm {
            padding: 5px 10px;
            font-size: 0.8rem;
            margin: 2px;
        }
        
        .btn-warning {
            background: #ff9800;
            border: none;
            color: white;
        }
        
        .btn-danger {
            background: #f44336;
            border: none;
            color: white;
        }
        
        .alert {
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .alert-success {
            background: rgba(76, 175, 80, 0.2);
            border: 1px solid rgba(76, 175, 80, 0.3);
            color: #4caf50;
        }
        
        .alert-danger {
            background: rgba(244, 67, 54, 0.2);
            border: 1px solid rgba(244, 67, 54, 0.3);
            color: #f44336;
        }
        
        .alert-info {
            background: rgba(33, 150, 243, 0.2);
            border: 1px solid rgba(33, 150, 243, 0.3);
            color: #2196f3;
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: rgba(255, 255, 255, 0.7);
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: rgba(255, 255, 255, 0.3);
        }
        
        .empty-state h4 {
            margin-bottom: 15px;
            color: rgba(255, 255, 255, 0.8);
        }
        
        .fade-in {
            animation: fadeIn 0.8s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
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
                        <a class="nav-link" href="cadastro.jsp">Cadastrar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="livros?action=listar">Consultar</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <!-- Page Header -->
            <div class="content-container fade-in">
                <div class="page-header">
                    <h2>
                        <i class="fas fa-search me-2"></i>
                        Consultar Acervo
                    </h2>
                    <p class="lead">Visualize e gerencie todos os livros cadastrados no sistema</p>
                </div>
            </div>

            <!-- Statistics -->
            <div class="content-container fade-in">
                <div class="stats-row">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-books"></i>
                                </div>
                                <div class="stat-number">
                                    <c:choose>
                                        <c:when test="${not empty totalLivros}">
                                            ${totalLivros}
                                        </c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                                </div>
                                <h6>Total de Livros</h6>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-check-circle"></i>
                                </div>
                                <div class="stat-number">
                                    <c:choose>
                                        <c:when test="${not empty totalLivros}">
                                            ${totalLivros}
                                        </c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                                </div>
                                <h6>Disponíveis</h6>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-book-reader"></i>
                                </div>
                                <div class="stat-number">0</div>
                                <h6>Emprestados</h6>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-tools"></i>
                                </div>
                                <div class="stat-number">0</div>
                                <h6>Manutenção</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search Section -->
            <div class="content-container fade-in">
                <div class="search-section">
                    <h5 class="mb-3">
                        <i class="fas fa-filter me-2"></i>
                        Filtros de Busca
                    </h5>
                    <form action="livros" method="get" class="search-form">
                        <input type="hidden" name="action" value="buscar">
                        
                        <div class="search-group">
                            <label for="termo" class="form-label">Buscar por:</label>
                            <input type="text" 
                                   class="form-control" 
                                   id="termo" 
                                   name="termo" 
                                   placeholder="Digite título ou autor"
                                   value="${termoBusca}">
                        </div>
                        
                        <div class="search-group">
                            <label for="tipo" class="form-label">Tipo:</label>
                            <select class="form-select" id="tipo" name="tipo">
                                <option value="titulo" ${tipoBusca == 'titulo' ? 'selected' : ''}>Título</option>
                                <option value="autor" ${tipoBusca == 'autor' ? 'selected' : ''}>Autor</option>
                            </select>
                        </div>
                        
                        <div class="search-group">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search me-2"></i>
                                Buscar
                            </button>
                            <a href="livros?action=listar" class="btn btn-secondary">
                                <i class="fas fa-refresh me-2"></i>
                                Limpar
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Messages -->
            <c:if test="${not empty sucesso}">
                <div class="alert alert-success fade-in" role="alert">
                    <i class="fas fa-check-circle me-2"></i>
                    ${sucesso}
                </div>
            </c:if>
            
            <c:if test="${not empty erro}">
                <div class="alert alert-danger fade-in" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    ${erro}
                </div>
            </c:if>
            
            <c:if test="${not empty termoBusca}">
                <div class="alert alert-info fade-in" role="alert">
                    <i class="fas fa-info-circle me-2"></i>
                    Resultados da busca por "<strong>${termoBusca}</strong>" em <strong>${tipoBusca}</strong>
                </div>
            </c:if>

            <!-- Books Table -->
            <div class="content-container fade-in">
                <div class="table-container">
                    <c:choose>
                        <c:when test="${empty livros}">
                            <div class="empty-state">
                                <i class="fas fa-book-open"></i>
                                <h4>Nenhum livro encontrado</h4>
                                <p>Não há livros cadastrados no sistema ou nenhum resultado foi encontrado para sua busca.</p>
                                <div class="action-buttons">
                                    <a href="cadastro.jsp" class="btn btn-primary">
                                        <i class="fas fa-plus me-2"></i>
                                        Cadastrar Primeiro Livro
                                    </a>
                                    <a href="livros?action=listar" class="btn btn-secondary">
                                        <i class="fas fa-refresh me-2"></i>
                                        Recarregar
                                    </a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5>
                                    <i class="fas fa-list me-2"></i>
                                    Livros Cadastrados
                                </h5>
                                <a href="cadastro.jsp" class="btn btn-primary">
                                    <i class="fas fa-plus me-2"></i>
                                    Novo Livro
                                </a>
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Título</th>
                                            <th>Autor</th>
                                            <th>Ano</th>
                                            <th>ISBN</th>
                                            <th>Status</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="livro" items="${livros}">
                                            <tr>
                                                <td class="text-center">${livro.id}</td>
                                                <td>
                                                    <strong>${livro.titulo}</strong>
                                                </td>
                                                <td>${livro.autor}</td>
                                                <td class="text-center">${livro.ano}</td>
                                                <td class="text-center">
                                                    <code>${livro.isbn}</code>
                                                </td>
                                                <td class="text-center">
                                                    <span class="badge badge-disponivel">
                                                        <i class="fas fa-check-circle me-1"></i>
                                                        Disponível
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <button type="button" 
                                                            class="btn btn-warning btn-sm"
                                                            onclick="visualizarLivro('${livro.id}', '${livro.titulo}', '${livro.autor}', '${livro.ano}', '${livro.isbn}')"
                                                            title="Visualizar detalhes">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                    
                                                    <button type="button" 
                                                            class="btn btn-danger btn-sm"
                                                            onclick="confirmarExclusao('${livro.isbn}', '${livro.titulo}')"
                                                            title="Excluir livro">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para visualizar detalhes -->
    <div class="modal fade" id="detalhesModal" tabindex="-1" aria-labelledby="detalhesModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background: rgba(255, 255, 255, 0.95); color: #333;">
                <div class="modal-header">
                    <h5 class="modal-title" id="detalhesModalLabel">
                        <i class="fas fa-book me-2"></i>
                        Detalhes do Livro
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4"><strong>ID:</strong></div>
                        <div class="col-md-8" id="modal-id"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>Título:</strong></div>
                        <div class="col-md-8" id="modal-titulo"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>Autor:</strong></div>
                        <div class="col-md-8" id="modal-autor"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>Ano:</strong></div>
                        <div class="col-md-8" id="modal-ano"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>ISBN:</strong></div>
                        <div class="col-md-8" id="modal-isbn"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>Status:</strong></div>
                        <div class="col-md-8">
                            <span class="badge badge-disponivel">
                                <i class="fas fa-check-circle me-1"></i>
                                Disponível
                            </span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Form oculto para exclusão -->
    <form id="excluirForm" action="livros" method="post" style="display: none;">
        <input type="hidden" name="action" value="excluir">
        <input type="hidden" name="isbn" id="excluir-isbn">
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        // Função para visualizar detalhes do livro
        function visualizarLivro(id, titulo, autor, ano, isbn) {
            document.getElementById('modal-id').textContent = id;
            document.getElementById('modal-titulo').textContent = titulo;
            document.getElementById('modal-autor').textContent = autor;
            document.getElementById('modal-ano').textContent = ano;
            document.getElementById('modal-isbn').textContent = isbn;
            
            const modal = new bootstrap.Modal(document.getElementById('detalhesModal'));
            modal.show();
        }
        
        // Função para confirmar exclusão
        function confirmarExclusao(isbn, titulo) {
            Swal.fire({
                title: 'Confirmar Exclusão',
                text: 'Tem certeza que deseja excluir o livro "' + titulo + '"?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#f44336',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sim, excluir!',
                cancelButtonText: 'Cancelar',
                background: 'rgba(255, 255, 255, 0.95)',
                backdrop: 'rgba(0, 0, 0, 0.7)'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('excluir-isbn').value = isbn;
                    document.getElementById('excluirForm').submit();
                }
            });
        }
        
        // Auto-focus no campo de busca
        document.getElementById('termo').focus();
        
        // Animação de entrada para as linhas da tabela
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach((row, index) => {
                row.style.animationDelay = index * 0.1 + 's';
                row.classList.add('fade-in');
            });
        });
    </script>
</body>
</html>