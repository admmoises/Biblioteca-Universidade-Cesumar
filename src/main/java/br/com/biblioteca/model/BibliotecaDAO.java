package br.com.biblioteca.model;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

/**
 * Data Access Object para operações de biblioteca
 * Implementa armazenamento em memória para livros
 */
public class BibliotecaDAO {
    private static final List<Livro> livros = new ArrayList<>();
    private static final AtomicLong idCounter = new AtomicLong(1);
    
    /**
     * Adiciona um novo livro à biblioteca
     * @param livro o livro a ser adicionado
     * @return true se adicionado com sucesso, false caso contrário
     */
    public static boolean adicionarLivro(Livro livro) {
        if (livro == null) {
            return false;
        }
        
        // Valida os dados do livro
        List<String> erros = ValidadorLivro.validarLivro(livro);
        if (!erros.isEmpty()) {
            return false;
        }
        
        // Verifica se já existe um livro com o mesmo ISBN
        if (buscarLivroPorISBN(livro.getIsbn()).isPresent()) {
            return false; // ISBN já existe
        }
        
        // Gera ID único e adiciona à lista
        livro.setId(idCounter.getAndIncrement());
        livros.add(livro);
        return true;
    }
    
    /**
     * Retorna uma lista de todos os livros
     * @return lista de livros (cópia)
     */
    public static List<Livro> listarLivros() {
        return new ArrayList<>(livros);
    }
    
    /**
     * Remove um livro da biblioteca pelo ISBN
     * @param isbn o ISBN do livro a ser removido
     * @return true se removido com sucesso, false caso não encontrado
     */
    public static boolean removerLivroPorISBN(String isbn) {
        if (isbn == null || isbn.trim().isEmpty()) {
            return false;
        }
        
        return livros.removeIf(livro -> isbn.equals(livro.getIsbn()));
    }
    
    /**
     * Busca um livro pelo ISBN
     * @param isbn o ISBN do livro
     * @return Optional contendo o livro se encontrado
     */
    public static Optional<Livro> buscarLivroPorISBN(String isbn) {
        if (isbn == null || isbn.trim().isEmpty()) {
            return Optional.empty();
        }
        
        return livros.stream()
                .filter(livro -> isbn.equals(livro.getIsbn()))
                .findFirst();
    }
    
    /**
     * Busca livros por título (busca parcial, case-insensitive)
     * @param titulo o título a ser buscado
     * @return lista de livros encontrados
     */
    public static List<Livro> buscarLivrosPorTitulo(String titulo) {
        if (titulo == null || titulo.trim().isEmpty()) {
            return new ArrayList<>();
        }
        
        String tituloLower = titulo.toLowerCase();
        return livros.stream()
                .filter(livro -> livro.getTitulo().toLowerCase().contains(tituloLower))
                .collect(Collectors.toList());
    }
    
    /**
     * Busca livros por autor (busca parcial, case-insensitive)
     * @param autor o nome do autor a ser buscado
     * @return lista de livros encontrados
     */
    public static List<Livro> buscarLivrosPorAutor(String autor) {
        if (autor == null || autor.trim().isEmpty()) {
            return new ArrayList<>();
        }
        
        String autorLower = autor.toLowerCase();
        return livros.stream()
                .filter(livro -> livro.getAutor().toLowerCase().contains(autorLower))
                .collect(Collectors.toList());
    }
    
    /**
     * Atualiza um livro existente
     * @param livro o livro com dados atualizados
     * @return true se atualizado com sucesso, false caso não encontrado ou dados inválidos
     */
    public static boolean atualizarLivro(Livro livro) {
        if (livro == null || livro.getId() == null) {
            return false;
        }
        
        // Valida os dados do livro
        List<String> erros = ValidadorLivro.validarLivro(livro);
        if (!erros.isEmpty()) {
            return false;
        }
        
        // Procura o livro pelo ID
        for (int i = 0; i < livros.size(); i++) {
            if (livros.get(i).getId().equals(livro.getId())) {
                // Verifica se o ISBN não está sendo usado por outro livro
                Optional<Livro> livroExistente = buscarLivroPorISBN(livro.getIsbn());
                if (livroExistente.isPresent() && !livroExistente.get().getId().equals(livro.getId())) {
                    return false; // ISBN já está sendo usado por outro livro
                }
                
                livros.set(i, livro);
                return true;
            }
        }
        
        return false; // Livro não encontrado
    }
    
    /**
     * Conta o número total de livros na biblioteca
     * @return número de livros
     */
    public static int contarLivros() {
        return livros.size();
    }
    
    /**
     * Remove todos os livros da biblioteca
     * Útil para testes ou reset do sistema
     */
    public static void limparBiblioteca() {
        livros.clear();
        idCounter.set(1);
    }
    
    /**
     * Verifica se um ISBN já existe na biblioteca
     * @param isbn o ISBN a ser verificado
     * @return true se o ISBN já existe, false caso contrário
     */
    public static boolean isbnExiste(String isbn) {
        return buscarLivroPorISBN(isbn).isPresent();
    }
}