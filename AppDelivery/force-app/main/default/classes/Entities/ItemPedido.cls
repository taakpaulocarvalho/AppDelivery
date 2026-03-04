public with sharing class ItemPedido extends EntidadeBase{

    public Produto produto { get; private set; }
    public Integer quantidade { get; private set; }
    public Dinheiro subtotal { get; private set; }

    public ItemPedido(Produto produto, Integer quantidade){
        super();
        this.produto = produto;
        this.quantidade = quantidade;
        this.subtotal = calcularSubtotal();
    }

    public Dinheiro calcularSubtotal(){
        return produto.preco.Multiplicar(quantidade);
    }

    public Integer adicionarQuantidade(Integer quantidade){
        this.quantidade += quantidade;
        subtotal = calcularSubtotal();
        return this.quantidade;
    }
}