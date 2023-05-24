package Models;
// Generated May 24, 2023 9:05:47 AM by Hibernate Tools 4.3.1



/**
 * PedidosHasProdutos generated by hbm2java
 */
public class PedidosHasProdutos  implements java.io.Serializable {


     private Integer id;
     private Pedidos pedidos;
     private Produtos produtos;
     private Integer qtde;
     private Float valor;

    public PedidosHasProdutos() {
    }

    public PedidosHasProdutos(Pedidos pedidos, Produtos produtos, Integer qtde, Float valor) {
       this.pedidos = pedidos;
       this.produtos = produtos;
       this.qtde = qtde;
       this.valor = valor;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Pedidos getPedidos() {
        return this.pedidos;
    }
    
    public void setPedidos(Pedidos pedidos) {
        this.pedidos = pedidos;
    }
    public Produtos getProdutos() {
        return this.produtos;
    }
    
    public void setProdutos(Produtos produtos) {
        this.produtos = produtos;
    }
    public Integer getQtde() {
        return this.qtde;
    }
    
    public void setQtde(Integer qtde) {
        this.qtde = qtde;
    }
    public Float getValor() {
        return this.valor;
    }
    
    public void setValor(Float valor) {
        this.valor = valor;
    }




}


