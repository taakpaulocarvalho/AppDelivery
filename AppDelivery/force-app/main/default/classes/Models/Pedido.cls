public with sharing class Pedido extends EntidadeBase{

    public Cliente cliente { get; set; }
    public Restaurante restaurante { get; set; }
    public List<ItemPedido> itens { get; set; }
    public StatusPedido status { get; set; }
    public Dinheiro total { get; set; }

    public Pedido(Cliente cliente, Restaurante restaurante){
        super();
        this.cliente = cliente;
        this.restaurante = restaurante;
        itens = new List<ItemPedido>();
        status = StatusPedido.CARRINHO;
        total = new Dinheiro(0);
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade){

        if (!restaurante.cardapio.contains(produto)){

            System.debug('Produto ' + produto.nome + ' não existe no cardápio!');
            return;
        }
        else{
            
            for (ItemPedido item : itens){

                if (item.produto.nome == produto.nome){
                    
                    item.quantidade += quantidade;
                    item.calcularSubtotal();
                    total = total.Somar(item.subtotal);
                    System.debug('A quantidade de ' + item.produto.nome + ' foi aumentada com sucesso!');

                    return;
                }
            } 

            ItemPedido item = new ItemPedido(produto, quantidade);
            itens.add(item);

            System.debug('O pedido foi adicionado com sucesso!');

            total = calcularTotal();
        }
    }

    public Dinheiro calcularTotal(){
        Dinheiro total = new Dinheiro(0);
        for (ItemPedido item : itens){
            total = total.Somar(item.calcularSubtotal());
        }
        return total;
    }

    public void confirmarPedido(){
        if (status == StatusPedido.CARRINHO && !itens.isEmpty()){
            status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('Pedido confirmado com sucesso!');
        }
        else{
            System.debug('O pedido NÃO foi confimado! Verifique se a lista de produtos está VAZIA!');
        }
    }

    public void exibirResumo(){

        System.debug('RESUMO DO PEDIDO');
        System.debug('Cliente: ' + cliente.nome);
        System.debug('Restaurante: ' + restaurante.nome);
        
        for (ItemPedido item : itens){
            System.debug('Produto: ' + item.produto.nome + ' - Quantidade: ' + item.quantidade + ' - Subtotal: ' + item.subtotal);
        }

        System.debug('Valor Total: ' + total);
        System.debug('Status do Pedido: ' + status);
    }
}