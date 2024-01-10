
package model;


public class Pedido {
    private int id;
    private int id_cliente;
    private String produto;
    private String preco;
    private String tamanho;
    private String cor;
    private int valor;

    public Pedido() {
    }

    
    public Pedido(int id_cliente, String produto, String preco, String tamanho, String cor) {
        this.id_cliente = id_cliente;
        this.produto = produto;
        this.preco = preco;
        this.tamanho = tamanho;
        this.cor = cor;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }
    
    
}
