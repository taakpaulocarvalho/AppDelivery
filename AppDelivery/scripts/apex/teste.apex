
//TESTES ETAPA 1
System.debug('TESTES ETAPA 1');
System.debug(' ');
Cliente cliente = new Cliente('Neymar', '4232445-54', 'SBC-SP', '(11)123123123');
System.debug(cliente.nome + ' ' + cliente.cpf + ' ' + cliente.endereco + ' ' + cliente.telefone);

Produto p1 = new Produto('Pizza Mussarela', 35.0);
Produto p2 = new Produto('Pizza Calabresa', 38.0);
Produto p3 = new Produto('Pizza Calabresa', 38.0);
Produto p4 = new Produto('Refrigerante', 8.0);
Produto p5 = new Produto('Pastel', 6.50);
List<Produto> prod = new List<Produto>();
prod.add(p1);
prod.add(p2);
prod.add(p3);
prod.add(p4);
prod.add(p1);
prod.add(p5);
Restaurante restaurante = new Restaurante('Bella Pizza', 'Av Antartico 381', CategoriaRestaurante.PIZZARIA, null);

//System.debug(restaurante.nome + ' ' + restaurante.endereco + ' ' + restaurante.categoria + ' ' + restaurante.cardapio[0].nome + ' ' + restaurante.cardapio[0].preco);

System.debug(' ');
System.debug(' ');

//TESTES ETAPA 2 
System.debug('TESTES ETAPA 2 ');
restaurante.adicionarProduto(p1);
restaurante.adicionarProduto(p2);
restaurante.adicionarProduto(p3);
restaurante.adicionarProduto(p4);
restaurante.adicionarProduto(p5);
System.debug(' ');
System.debug('EXIBIR CARDAPIO');
restaurante.exibirCardapio();
System.debug(' ');
System.debug('BUSCAR PRODUTOS');
List<Produto> buscaProd = restaurante.buscarProdutos('Pizza');
for (Produto prod : buscaProd){
    System.debug('Produtos encontrados: ' + prod.nome + ' - ' + prod.preco);
}

System.debug('');
System.debug('');



System.debug('TESTES ETAPA 3');

Pedido pedido = new Pedido(cliente, restaurante);
System.debug('MÉTODO ADICIONAR PEDIDO');
System.debug('');
pedido.adicionarItemPedido(p1, 2);
pedido.adicionarItemPedido(p2, 1);
pedido.adicionarItemPedido(p2, 1);
pedido.adicionarItemPedido(p4, 1);
pedido.adicionarItemPedido(p5, 1);
System.debug('MÉTODO CALCULAR TOTAL');
System.debug('');
pedido.calcularTotal();
System.debug('MÉTODO CONFIRMAR PEDIDO');
System.debug('');
pedido.confirmarPedido();
System.debug('MÉTODO EXIBIR RESUMO');
System.debug('');
pedido.exibirResumo();