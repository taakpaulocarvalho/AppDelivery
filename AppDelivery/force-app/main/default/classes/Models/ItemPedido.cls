public with sharing class ItemPedido extends EntidadeBase{

    public Produto produto { get; set; }
    public Integer quantidade { get; set; }
    public Dinheiro subtotal { get; set; }

    public ItemPedido(Produto produto, Integer quantidade){
        super();
        this.produto = produto;
        this.quantidade = quantidade;
        this.subtotal = calcularSubtotal();
    }

    public Dinheiro calcularSubtotal(){
        return produto.preco.Multiplicar(quantidade);
    }
}