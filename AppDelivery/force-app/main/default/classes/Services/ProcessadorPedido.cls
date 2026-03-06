public with sharing class ProcessadorPedido {
    
    public ProcessadorPedido(){}

    public void adicionarProduto(Pedido pedido, Produto produto, Integer quantidade, Restaurante restaurante){
         if (pedido.status != StatusPedido.CARRINHO){
            throw new IllegalArgumentException('O pedido deve estar com status CARRINHO para adicionar produtos!');
        }

        if (quantidade <= 0){
            throw new IllegalArgumentException('A quantidade deve ser maior que zero!');
        }
        
        if (!restaurante.getCardapio().contains(produto)){
            throw new IllegalArgumentException('Produto ' + produto.nome + ' não existe no cardápio!');
        }

        pedido.adicionarItemPedido(produto, quantidade);
    }

    public void confirmarPedido(Pedido pedido){
     
        if (pedido.status != StatusPedido.CARRINHO){
            throw new IllegalArgumentException('O pedido deve estar no status CARRINHO para ser confirmado!');
        }

        if (pedido == null || pedido.getItens().isEmpty()){
            throw new IllegalArgumentException('O pedido deve ter pelo menos um item!');
        }

        if (pedido.total.valorMonetario <= 0){
            throw new IllegalArgumentException('O pedido deve ter um valor maior que zero!');
        }

       pedido.confirmar();
       pedido.calcularTotal();
       System.debug('Pedido confirmado com sucesso!');
    }

    public void cancelarPedido(Pedido pedido){
        if (pedido.status != StatusPedido.CARRINHO){
            throw new IllegalArgumentException('O pedido deve estar no status CARRINHO para ser cancelado!');
        }

        pedido.cancelar();
        System.debug('Pedido cancelado com sucesso!');
    }

    public void removerProduto(Pedido pedido, Produto produto){
        if (pedido.status != StatusPedido.CARRINHO){
            throw new IllegalArgumentException('O pedido deve estar no status CARRINHO para remover um produto!');
        }

        pedido.executarRemocao(produto);
    }

    public void alterarQuantidade(Pedido pedido, Produto produto, Integer quantidade){
         if (pedido.status != StatusPedido.CARRINHO){
            throw new IllegalArgumentException('O pedido deve estar no status CARRINHO para remover um produto!');
        }

        if (quantidade <= 0){
            pedido.executarRemocao(produto);
            return;
        }
        pedido.executaAlteraQuantidade(produto, quantidade);
        pedido.calcularTotal();
    }
}