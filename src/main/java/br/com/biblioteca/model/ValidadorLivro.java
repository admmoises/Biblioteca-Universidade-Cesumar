package br.com.biblioteca.model;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Classe utilitária para validação de dados de livros
 */
public class ValidadorLivro {
    
    // Constantes para validação
    private static final int TITULO_MAX_LENGTH = 200;
    private static final int AUTOR_MAX_LENGTH = 100;
    private static final int ANO_MIN = 1000;
    private static final int ANO_MAX = 2100;
    private static final Pattern ISBN_PATTERN = Pattern.compile("^[0-9X-]+$");
    
    /**
     * Valida todos os campos de um livro
     * @param livro o livro a ser validado
     * @return lista de erros encontrados (vazia se válido)
     */
    public static List<String> validarLivro(Livro livro) {
        List<String> erros = new ArrayList<>();
        
        if (livro == null) {
            erros.add("Livro não pode ser nulo");
            return erros;
        }
        
        // Valida título
        String erroTitulo = validarTitulo(livro.getTitulo());
        if (erroTitulo != null) {
            erros.add(erroTitulo);
        }
        
        // Valida autor
        String erroAutor = validarAutor(livro.getAutor());
        if (erroAutor != null) {
            erros.add(erroAutor);
        }
        
        // Valida ano
        String erroAno = validarAno(livro.getAno());
        if (erroAno != null) {
            erros.add(erroAno);
        }
        
        // Valida ISBN
        String erroIsbn = validarISBN(livro.getIsbn());
        if (erroIsbn != null) {
            erros.add(erroIsbn);
        }
        
        return erros;
    }
    
    /**
     * Valida o título do livro
     * @param titulo o título a ser validado
     * @return mensagem de erro ou null se válido
     */
    public static String validarTitulo(String titulo) {
        if (titulo == null || titulo.trim().isEmpty()) {
            return "Título é obrigatório";
        }
        
        if (titulo.length() > TITULO_MAX_LENGTH) {
            return "Título não pode ter mais de " + TITULO_MAX_LENGTH + " caracteres";
        }
        
        return null;
    }
    
    /**
     * Valida o autor do livro
     * @param autor o autor a ser validado
     * @return mensagem de erro ou null se válido
     */
    public static String validarAutor(String autor) {
        if (autor == null || autor.trim().isEmpty()) {
            return "Autor é obrigatório";
        }
        
        if (autor.length() > AUTOR_MAX_LENGTH) {
            return "Autor não pode ter mais de " + AUTOR_MAX_LENGTH + " caracteres";
        }
        
        return null;
    }
    
    /**
     * Valida o ano de publicação
     * @param ano o ano a ser validado
     * @return mensagem de erro ou null se válido
     */
    public static String validarAno(Integer ano) {
        if (ano == null) {
            return "Ano de publicação é obrigatório";
        }
        
        if (ano < ANO_MIN || ano > ANO_MAX) {
            return "Ano deve estar entre " + ANO_MIN + " e " + ANO_MAX;
        }
        
        return null;
    }
    
    /**
     * Valida o ISBN do livro
     * @param isbn o ISBN a ser validado
     * @return mensagem de erro ou null se válido
     */
    public static String validarISBN(String isbn) {
        if (isbn == null || isbn.trim().isEmpty()) {
            return "ISBN é obrigatório";
        }
        
        // Remove hífens e espaços para validação
        String isbnLimpo = normalizarISBN(isbn);
        
        if (isbnLimpo.length() != 10 && isbnLimpo.length() != 13) {
            return "ISBN deve ter 10 ou 13 dígitos";
        }
        
        if (!ISBN_PATTERN.matcher(isbnLimpo).matches()) {
            return "ISBN deve conter apenas números e, opcionalmente, X no final (para ISBN-10)";
        }
        
        // Valida ISBN-10
        if (isbnLimpo.length() == 10) {
            if (!validarISBN10(isbnLimpo)) {
                return "ISBN-10 inválido (dígito verificador incorreto)";
            }
        }
        
        // Valida ISBN-13
        if (isbnLimpo.length() == 13) {
            if (!validarISBN13(isbnLimpo)) {
                return "ISBN-13 inválido (dígito verificador incorreto)";
            }
        }
        
        return null;
    }
    
    /**
     * Valida o dígito verificador do ISBN-10
     * @param isbn o ISBN-10 a ser validado
     * @return true se válido, false caso contrário
     */
    private static boolean validarISBN10(String isbn) {
        int soma = 0;
        for (int i = 0; i < 9; i++) {
            if (!Character.isDigit(isbn.charAt(i))) {
                return false;
            }
            soma += Character.getNumericValue(isbn.charAt(i)) * (10 - i);
        }
        
        char ultimoChar = isbn.charAt(9);
        int ultimoDigito;
        
        if (ultimoChar == 'X') {
            ultimoDigito = 10;
        } else if (Character.isDigit(ultimoChar)) {
            ultimoDigito = Character.getNumericValue(ultimoChar);
        } else {
            return false;
        }
        
        soma += ultimoDigito;
        return soma % 11 == 0;
    }
    
    /**
     * Valida o dígito verificador do ISBN-13
     * @param isbn o ISBN-13 a ser validado
     * @return true se válido, false caso contrário
     */
    private static boolean validarISBN13(String isbn) {
        int soma = 0;
        for (int i = 0; i < 12; i++) {
            if (!Character.isDigit(isbn.charAt(i))) {
                return false;
            }
            int digito = Character.getNumericValue(isbn.charAt(i));
            soma += (i % 2 == 0) ? digito : digito * 3;
        }
        
        if (!Character.isDigit(isbn.charAt(12))) {
            return false;
        }
        
        int ultimoDigito = Character.getNumericValue(isbn.charAt(12));
        int digitoVerificador = (10 - (soma % 10)) % 10;
        
        return ultimoDigito == digitoVerificador;
    }
    
    /**
     * Verifica se um livro está completamente válido
     * @param livro o livro a ser verificado
     * @return true se válido, false caso contrário
     */
    public static boolean isLivroCompleto(Livro livro) {
        return validarLivro(livro).isEmpty();
    }
    
    /**
     * Sanitiza texto removendo espaços extras
     * @param texto o texto a ser sanitizado
     * @return texto sanitizado
     */
    public static String sanitizarTexto(String texto) {
        if (texto == null) {
            return null;
        }
        return texto.trim().replaceAll("\\s+", " ");
    }
    
    /**
     * Normaliza ISBN removendo hífens e espaços
     * @param isbn o ISBN a ser normalizado
     * @return ISBN normalizado
     */
    public static String normalizarISBN(String isbn) {
        if (isbn == null) {
            return null;
        }
        return isbn.replaceAll("[-\\s]", "").toUpperCase();
    }
    
    /**
     * Formata ISBN para exibição
     * @param isbn o ISBN a ser formatado
     * @return ISBN formatado com hífens
     */
    public static String formatarISBN(String isbn) {
        if (isbn == null) {
            return null;
        }
        
        String isbnLimpo = normalizarISBN(isbn);
        
        if (isbnLimpo.length() == 10) {
            // Formato ISBN-10: X-XXX-XXXXX-X
            return isbnLimpo.substring(0, 1) + "-" +
                   isbnLimpo.substring(1, 4) + "-" +
                   isbnLimpo.substring(4, 9) + "-" +
                   isbnLimpo.substring(9, 10);
        } else if (isbnLimpo.length() == 13) {
            // Formato ISBN-13: XXX-X-XXX-XXXXX-X
            return isbnLimpo.substring(0, 3) + "-" +
                   isbnLimpo.substring(3, 4) + "-" +
                   isbnLimpo.substring(4, 7) + "-" +
                   isbnLimpo.substring(7, 12) + "-" +
                   isbnLimpo.substring(12, 13);
        }
        
        return isbn; // Retorna original se não conseguir formatar
    }
}