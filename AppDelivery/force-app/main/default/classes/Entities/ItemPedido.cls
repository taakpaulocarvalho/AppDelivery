public with sharing class ItemPedido extends EntidadeBase{

    public Produto produto { get; private set; }
    public Integer quantidade { get; private set; }
    public Dinheiro subtotal { get; private set; }

    public ItemPedido(Produto produto, Integer quantidade){
        super();
        if(produto == null || produto.preco.valorMonetario < 0){
            throw new IllegalArgumentException('O produto deve ter um preço válido!');
        }
        
        if(quantidade <= 0)
            throw new IllegalArgumentException('Quantidade deve ser maior que zero!');
        
        this.produto = produto;
        this.quantidade = quantidade;
        this.subtotal = calcularSubtotal();
    }

    public Dinheiro calcularSubtotal(){
        return produto.preco.Multiplicar(this.quantidade);
    }

    public Integer adicionarQuantidade(Integer quantidade){
        if (quantidade <= 0){
            throw new IllegalArgumentException('Quantidade deve ser maior que zero!');
        }

        this.quantidade += quantidade;
        subtotal = calcularSubtotal();
        return this.quantidade;
    }

    public void atualizarQuantidade(Integer quantidade){
        if (quantidade <= 0){
            throw new IllegalArgumentException('Quantidade deve ser maior que zero!');
        }

        this.quantidade = quantidade;
        this.subtotal = calcularSubtotal();
    }
}