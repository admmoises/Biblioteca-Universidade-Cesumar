package br.com.biblioteca.controller;

import br.com.biblioteca.model.Livro;
import br.com.biblioteca.model.BibliotecaDAO;
import br.com.biblioteca.model.ValidadorLivro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

/**
 * Servlet para controle de operações de livros
 * Implementa padrão MVC com controle centralizado
 */
@WebServlet(urlPatterns = {"/livros", "/livros/*"})
public class LivroServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Processa requisições GET (listagem e detalhamento)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        try {
            if ("listar".equals(action) || action == null) {
                listarLivros(request, response);
            } else if ("detalhar".equals(action)) {
                detalharLivro(request, response);
            } else if ("buscar".equals(action)) {
                buscarLivros(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação não reconhecida");
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Erro interno do servidor: " + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        }
    }
    
    /**
     * Processa requisições POST (cadastro, atualização e exclusão)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        try {
            if ("cadastrar".equals(action) || action == null) {
                cadastrarLivro(request, response);
            } else if ("excluir".equals(action)) {
                excluirLivro(request, response);
            } else if ("atualizar".equals(action)) {
                atualizarLivro(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação não reconhecida");
            }
        } catch (Exception e) {
            request.setAttribute("erro", "Erro interno do servidor: " + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        }
    }
    
    /**
     * Lista todos os livros cadastrados
     */
    private void listarLivros(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Livro> livros = BibliotecaDAO.listarLivros();
        request.setAttribute("livros", livros);
        request.setAttribute("totalLivros", livros.size());
        
        request.getRequestDispatcher("/listagem.jsp").forward(request, response);
    }
    
    /**
     * Detalha um livro específico pelo ISBN
     */
    private void detalharLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String isbn = request.getParameter("isbn");
        
        if (isbn == null || isbn.trim().isEmpty()) {
            request.setAttribute("erro", "ISBN é obrigatório para detalhar livro");
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
            return;
        }
        
        Optional<Livro> livro = BibliotecaDAO.buscarLivroPorISBN(isbn);
        
        if (livro.isPresent()) {
            request.setAttribute("livro", livro.get());
            request.getRequestDispatcher("/detalhes.jsp").forward(request, response);
        } else {
            request.setAttribute("erro", "Livro não encontrado com ISBN: " + isbn);
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        }
    }
    
    /**
     * Busca livros por título ou autor
     */
    private void buscarLivros(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String termo = request.getParameter("termo");
        String tipo = request.getParameter("tipo"); // "titulo" ou "autor"
        
        List<Livro> livros;
        
        if (termo == null || termo.trim().isEmpty()) {
            livros = BibliotecaDAO.listarLivros();
        } else {
            if ("autor".equals(tipo)) {
                livros = BibliotecaDAO.buscarLivrosPorAutor(termo);
            } else {
                livros = BibliotecaDAO.buscarLivrosPorTitulo(termo);
            }
        }
        
        request.setAttribute("livros", livros);
        request.setAttribute("termoBusca", termo);
        request.setAttribute("tipoBusca", tipo);
        request.setAttribute("totalLivros", livros.size());
        
        request.getRequestDispatcher("/listagem.jsp").forward(request, response);
    }
    
    /**
     * Cadastra um novo livro
     */
    private void cadastrarLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Coleta dados do formulário
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoStr = request.getParameter("ano");
        String isbn = request.getParameter("isbn");
        
        // Sanitiza os dados
        titulo = ValidadorLivro.sanitizarTexto(titulo);
        autor = ValidadorLivro.sanitizarTexto(autor);
        isbn = ValidadorLivro.normalizarISBN(isbn);
        
        // Converte ano para Integer
        Integer ano = null;
        if (anoStr != null && !anoStr.trim().isEmpty()) {
            try {
                ano = Integer.valueOf(anoStr.trim());
            } catch (NumberFormatException e) {
                request.setAttribute("erro", "Ano deve ser um número válido");
                request.setAttribute("titulo", titulo);
                request.setAttribute("autor", autor);
                request.setAttribute("isbn", isbn);
                request.getRequestDispatcher("/cadastro.jsp").forward(request, response);
                return;
            }
        }
        
        // Cria objeto livro
        Livro livro = new Livro(titulo, autor, ano, isbn);
        
        // Valida dados
        List<String> erros = ValidadorLivro.validarLivro(livro);
        
        if (!erros.isEmpty()) {
            request.setAttribute("erros", erros);
            request.setAttribute("titulo", titulo);
            request.setAttribute("autor", autor);
            request.setAttribute("ano", ano);
            request.setAttribute("isbn", isbn);
            request.getRequestDispatcher("/cadastro.jsp").forward(request, response);
            return;
        }
        
        // Verifica se ISBN já existe
        if (BibliotecaDAO.isbnExiste(isbn)) {
            request.setAttribute("erro", "Já existe um livro cadastrado com este ISBN");
            request.setAttribute("titulo", titulo);
            request.setAttribute("autor", autor);
            request.setAttribute("ano", ano);
            request.setAttribute("isbn", isbn);
            request.getRequestDispatcher("/cadastro.jsp").forward(request, response);
            return;
        }
        
        // Adiciona o livro
        if (BibliotecaDAO.adicionarLivro(livro)) {
            request.setAttribute("sucesso", "Livro cadastrado com sucesso!");
            request.getRequestDispatcher("/livros?action=listar").forward(request, response);
        } else {
            request.setAttribute("erro", "Erro ao cadastrar livro. Tente novamente.");
            request.setAttribute("titulo", titulo);
            request.setAttribute("autor", autor);
            request.setAttribute("ano", ano);
            request.setAttribute("isbn", isbn);
            request.getRequestDispatcher("/cadastro.jsp").forward(request, response);
        }
    }
    
    /**
     * Exclui um livro pelo ISBN
     */
    private void excluirLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String isbn = request.getParameter("isbn");
        
        if (isbn == null || isbn.trim().isEmpty()) {
            request.setAttribute("erro", "ISBN é obrigatório para exclusão");
            listarLivros(request, response);
            return;
        }
        
        // Normaliza ISBN
        isbn = ValidadorLivro.normalizarISBN(isbn);
        
        // Verifica se o livro existe antes de excluir
        Optional<Livro> livro = BibliotecaDAO.buscarLivroPorISBN(isbn);
        
        if (!livro.isPresent()) {
            request.setAttribute("erro", "Livro não encontrado para exclusão");
            listarLivros(request, response);
            return;
        }
        
        // Remove o livro
        if (BibliotecaDAO.removerLivroPorISBN(isbn)) {
            request.setAttribute("sucesso", "Livro '" + livro.get().getTitulo() + "' excluído com sucesso!");
        } else {
            request.setAttribute("erro", "Erro ao excluir livro. Tente novamente.");
        }
        
        listarLivros(request, response);
    }
    
    /**
     * Atualiza um livro existente
     */
    private void atualizarLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoStr = request.getParameter("ano");
        String isbn = request.getParameter("isbn");
        
        // Valida ID
        if (idStr == null || idStr.trim().isEmpty()) {
            request.setAttribute("erro", "ID é obrigatório para atualização");
            listarLivros(request, response);
            return;
        }
        
        Long id;
        try {
            id = Long.valueOf(idStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "ID deve ser um número válido");
            listarLivros(request, response);
            return;
        }
        
        // Sanitiza os dados
        titulo = ValidadorLivro.sanitizarTexto(titulo);
        autor = ValidadorLivro.sanitizarTexto(autor);
        isbn = ValidadorLivro.normalizarISBN(isbn);
        
        // Converte ano para Integer
        Integer ano = null;
        if (anoStr != null && !anoStr.trim().isEmpty()) {
            try {
                ano = Integer.valueOf(anoStr.trim());
            } catch (NumberFormatException e) {
                request.setAttribute("erro", "Ano deve ser um número válido");
                listarLivros(request, response);
                return;
            }
        }
        
        // Cria objeto livro atualizado
        Livro livro = new Livro(id, titulo, autor, ano, isbn);
        
        // Valida dados
        List<String> erros = ValidadorLivro.validarLivro(livro);
        
        if (!erros.isEmpty()) {
            request.setAttribute("erros", erros);
            listarLivros(request, response);
            return;
        }
        
        // Atualiza o livro
        if (BibliotecaDAO.atualizarLivro(livro)) {
            request.setAttribute("sucesso", "Livro atualizado com sucesso!");
        } else {
            request.setAttribute("erro", "Erro ao atualizar livro. Verifique se o ISBN não está sendo usado por outro livro.");
        }
        
        listarLivros(request, response);
    }
    
    /**
     * Método auxiliar para obter informações sobre o servlet
     */
    @Override
    public String getServletInfo() {
        return "Servlet para controle de operações de livros - Sistema Biblioteca Cesumar";
    }
}