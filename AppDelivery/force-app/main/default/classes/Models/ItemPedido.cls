public with sharing class ItemPedido extends EntidadeBase{

    public Produto produto { get; set; }
    public Integer quantidade { get; set; }
    public Decimal subtotal { get; set; }

    public ItemPedido(Produto produto, Integer quantidade){
        super();
        this.produto = produto;
        this.quantidade = quantidade;
        this.subtotal = calcularSubtotal();
    }

    public Decimal calcularSubtotal(){
        return produto.preco * quantidade;
    }
}