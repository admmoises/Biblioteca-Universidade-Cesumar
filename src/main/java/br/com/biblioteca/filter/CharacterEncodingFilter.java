package br.com.biblioteca.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Filtro para garantir encoding UTF-8 em todas as requisições
 */
@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialização do filtro
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        // Define encoding UTF-8 para requisição e resposta
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        // Continua a cadeia de filtros
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        // Limpeza de recursos
    }
}