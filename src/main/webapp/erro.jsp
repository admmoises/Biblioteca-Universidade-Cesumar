<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erro - Biblioteca Cesumar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .error-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            color: white;
            max-width: 600px;
            margin: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .error-icon {
            font-size: 6rem;
            color: #ff6b6b;
            margin-bottom: 30px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        .error-code {
            font-size: 3rem;
            font-weight: bold;
            color: #ffd700;
            margin-bottom: 20px;
        }
        
        .error-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: white;
        }
        
        .error-message {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
        }
        
        .error-details {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: left;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.8);
        }
        
        .error-suggestions {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: left;
        }
        
        .error-suggestions h5 {
            color: #ffd700;
            margin-bottom: 15px;
        }
        
        .error-suggestions ul {
            margin: 0;
            padding-left: 20px;
        }
        
        .error-suggestions li {
            margin-bottom: 8px;
            color: rgba(255, 255, 255, 0.9);
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
            margin: 10px;
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
            margin: 10px;
        }
        
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            color: white;
        }
        
        .contact-info {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
        }
        
        .contact-info h5 {
            color: #ffd700;
            margin-bottom: 15px;
        }
        
        .contact-info p {
            margin: 5px 0;
            color: rgba(255, 255, 255, 0.9);
        }
        
        .fade-in {
            animation: fadeIn 1s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .error-timestamp {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.6);
            margin-top: 20px;
        }
        
        .toggle-details {
            background: none;
            border: none;
            color: #ffd700;
            text-decoration: underline;
            cursor: pointer;
            font-size: 0.9rem;
            margin-top: 10px;
        }
        
        .toggle-details:hover {
            color: #ff6b6b;
        }
    </style>
</head>
<body>
    <div class="error-container fade-in">
        <!-- Determina o código de erro -->
        <c:set var="statusCode" value="${pageContext.response.status}"/>
        <c:if test="${empty statusCode}">
            <c:set var="statusCode" value="500"/>
        </c:if>
        
        <!-- Ícone de erro -->
        <div class="error-icon">
            <c:choose>
                <c:when test="${statusCode == 404}">
                    <i class="fas fa-search"></i>
                </c:when>
                <c:when test="${statusCode == 403}">
                    <i class="fas fa-lock"></i>
                </c:when>
                <c:when test="${statusCode == 500}">
                    <i class="fas fa-exclamation-triangle"></i>
                </c:when>
                <c:otherwise>
                    <i class="fas fa-bug"></i>
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Código de erro -->
        <div class="error-code">${statusCode}</div>
        
        <!-- Título do erro -->
        <div class="error-title">
            <c:choose>
                <c:when test="${statusCode == 404}">
                    Página Não Encontrada
                </c:when>
                <c:when test="${statusCode == 403}">
                    Acesso Negado
                </c:when>
                <c:when test="${statusCode == 500}">
                    Erro Interno do Servidor
                </c:when>
                <c:otherwise>
                    Erro Inesperado
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Mensagem de erro -->
        <div class="error-message">
            <c:choose>
                <c:when test="${not empty erro}">
                    ${erro}
                </c:when>
                <c:when test="${statusCode == 404}">
                    A página que você está procurando não foi encontrada no servidor.
                </c:when>
                <c:when test="${statusCode == 403}">
                    Você não tem permissão para acessar este recurso.
                </c:when>
                <c:when test="${statusCode == 500}">
                    Ocorreu um erro interno no servidor. Tente novamente mais tarde.
                </c:when>
                <c:otherwise>
                    Ocorreu um erro inesperado. Nossa equipe foi notificada automaticamente.
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Sugestões baseadas no tipo de erro -->
        <div class="error-suggestions">
            <h5>
                <i class="fas fa-lightbulb me-2"></i>
                Sugestões
            </h5>
            <ul>
                <c:choose>
                    <c:when test="${statusCode == 404}">
                        <li>Verifique se o endereço foi digitado corretamente</li>
                        <li>Tente usar o menu de navegação para encontrar a página</li>
                        <li>Volte à página inicial e navegue a partir de lá</li>
                        <li>Use a função de busca para encontrar o que procura</li>
                    </c:when>
                    <c:when test="${statusCode == 403}">
                        <li>Verifique se você está logado no sistema</li>
                        <li>Contate o administrador para verificar suas permissões</li>
                        <li>Tente fazer login novamente</li>
                        <li>Verifique se sua sessão não expirou</li>
                    </c:when>
                    <c:when test="${statusCode == 500}">
                        <li>Tente recarregar a página</li>
                        <li>Aguarde alguns minutos e tente novamente</li>
                        <li>Limpe o cache do seu navegador</li>
                        <li>Entre em contato com o suporte se o problema persistir</li>
                    </c:when>
                    <c:otherwise>
                        <li>Tente recarregar a página</li>
                        <li>Verifique sua conexão com a internet</li>
                        <li>Volte à página inicial</li>
                        <li>Entre em contato com o suporte técnico</li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        
        <!-- Botões de ação -->
        <div class="action-buttons">
            <button onclick="history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-2"></i>
                Voltar
            </button>
            <button onclick="window.location.reload()" class="btn btn-secondary">
                <i class="fas fa-refresh me-2"></i>
                Recarregar
            </button>
            <a href="index.jsp" class="btn btn-primary">
                <i class="fas fa-home me-2"></i>
                Página Inicial
            </a>
        </div>
        
        <!-- Detalhes técnicos (apenas em ambiente de desenvolvimento) -->
        <c:if test="${not empty pageContext.exception}">
            <button class="toggle-details" onclick="toggleDetails()">
                <i class="fas fa-info-circle me-1"></i>
                Mostrar detalhes técnicos
            </button>
            
            <div id="error-details" class="error-details" style="display: none;">
                <h6>Detalhes Técnicos:</h6>
                <strong>Exceção:</strong> ${pageContext.exception.class.name}<br/>
                <strong>Mensagem:</strong> ${pageContext.exception.message}<br/>
                <strong>URI:</strong> ${pageContext.request.requestURI}<br/>
                <strong>Método:</strong> ${pageContext.request.method}<br/>
                <strong>User Agent:</strong> ${pageContext.request.getHeader("User-Agent")}<br/>
                <strong>Timestamp:</strong> <script>document.write(new Date().toLocaleString());</script>
            </div>
        </c:if>
        
        <!-- Informações de contato -->
        <div class="contact-info">
            <h5>
                <i class="fas fa-life-ring me-2"></i>
                Precisa de Ajuda?
            </h5>
            <p>
                <i class="fas fa-envelope me-2"></i>
                Email: biblioteca@cesumar.br
            </p>
            <p>
                <i class="fas fa-phone me-2"></i>
                Telefone: (44) 3027-6360
            </p>
            <p>
                <i class="fas fa-clock me-2"></i>
                Horário de Atendimento: 08:00 às 18:00
            </p>
        </div>
        
        <!-- Timestamp -->
        <div class="error-timestamp">
            <i class="fas fa-clock me-1"></i>
            <script>document.write("Erro registrado em: " + new Date().toLocaleString());</script>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Função para alternar exibição de detalhes técnicos
        function toggleDetails() {
            const details = document.getElementById('error-details');
            const button = document.querySelector('.toggle-details');
            
            if (details.style.display === 'none') {
                details.style.display = 'block';
                button.innerHTML = '<i class="fas fa-info-circle me-1"></i> Ocultar detalhes técnicos';
            } else {
                details.style.display = 'none';
                button.innerHTML = '<i class="fas fa-info-circle me-1"></i> Mostrar detalhes técnicos';
            }
        }
        
        // Reportar erro automaticamente (opcional)
        function reportError() {
            // Implementar integração com sistema de logging se necessário
            console.log('Erro reportado automaticamente');
        }
        
        // Chama função de report ao carregar a página
        window.addEventListener('load', function() {
            // reportError(); // Descomente para ativar report automático
        });
        
        // Adiciona suporte para navegação por teclado
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                history.back();
            }
            if (e.key === 'Home') {
                window.location.href = 'index.jsp';
            }
        });
    </script>
</body>
</html>