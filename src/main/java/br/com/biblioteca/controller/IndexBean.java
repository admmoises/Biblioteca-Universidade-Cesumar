package br.com.biblioteca.controller;

import br.com.biblioteca.model.BibliotecaDAO;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;

/**
 * Managed Bean para a página inicial do sistema
 * Fornece dados estatísticos para exibição na interface JSF
 */
@ManagedBean
@ViewScoped
public class IndexBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Retorna o total de livros cadastrados no sistema
     * @return número total de livros
     */
    public int getTotalLivros() {
        return BibliotecaDAO.listarLivros().size();
    }
    
    /**
     * Retorna o número de usuários ativos (valor mock)
     * @return número de usuários ativos
     */
    public int getUsuariosAtivos() {
        return 1250;
    }
    
    /**
     * Retorna o número de empréstimos ativos (valor mock)
     * @return número de empréstimos ativos
     */
    public int getEmprestimosAtivos() {
        return 345;
    }
}