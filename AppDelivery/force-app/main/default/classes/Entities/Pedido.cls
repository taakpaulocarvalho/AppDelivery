public with sharing class Pedido extends EntidadeBase{

    public Cliente cliente { get; private set; }
    public Restaurante restaurante { get; private set; }
    private List<ItemPedido> itens;
    public StatusPedido status { get; private set; }
    public Dinheiro total { get; private set; }

    public Pedido(Cliente cliente, Restaurante restaurante){
        super();
        this.cliente = cliente;
        this.restaurante = restaurante;
        itens = new List<ItemPedido>();
        status = StatusPedido.CARRINHO;
        total = new Dinheiro(0);
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade){

        if (quantidade <= 0){
            System.debug('A quantidade deve ser maior que zero!');
            return;
        }
        
        if (!restaurante.cardapio.contains(produto)){

            System.debug('Produto ' + produto.nome + ' não existe no cardápio!');
            return;
        }
        else{
            
            for (ItemPedido item : itens){

                if (item.produto.id == produto.id){
                    
                    item.adicionarQuantidade(quantidade);
                    total = calcularTotal();
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

    public void removerProduto(Produto produto){

        for(Integer i = 0; i < itens.size(); i++){
            if (itens[i].produto.id == produto.id){
                itens.remove(i);
                total = calcularTotal();
                System.debug('O produto ' + produto.nome + ' foi removido com sucesso!');
                return;   
            }
        }
    }

    public void alterarQuantidade(Produto produto, Integer quantidade){
        
        if (quantidade <= 0){
            removerProduto(produto);
            return;
        }

        for (ItemPedido item : itens){
            if (item.produto.id == produto.id){
                item.atualizarQuantidade(quantidade);
                this.total = calcularTotal();
                return;
            } 
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

    public List<ItemPedido>  getItens(){
        return itens;
    }
}