/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import DAO.ClienteDao;
import Models.Clientes;


/**
 *
 * @author elcon
 */
@ManagedBean
@ViewScoped
public class ClientesControl {

    /**
     * Creates a new instance of ClientesControl
     */
    private List<Clientes> listaClientes;
    private Clientes cliente;

    public ClientesControl() {
        cliente = new Clientes();
    }

    public List<Clientes> getListaClientes() {
        ClienteDao ad = new ClienteDao();
        listaClientes = ad.listarClientes();
        return listaClientes;
    }

    public void setListaClientes(List<Clientes> listaClientes) {
        this.listaClientes = listaClientes;
    }

    public Clientes getClientes() {
        return cliente;
    }

    public void setClientes(Clientes cliente) {
        this.cliente = cliente;
    }

    public void apagarClientes() {
        cliente = new Clientes();
    }

    public void adicionarClientes() {
        ClienteDao ad = new ClienteDao();
        ad.adicionar(cliente);
    }

    public void modificarClientes() {
        ClienteDao ad = new ClienteDao();
        ad.modificar(cliente);
        apagarClientes();
    }

    public void eliminarClientes() {
        ClienteDao ad = new ClienteDao();
        ad.eliminar(cliente);
        apagarClientes();
    }
}
