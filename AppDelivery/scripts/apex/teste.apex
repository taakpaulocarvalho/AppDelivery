Cliente cliente = new Cliente('nome', 'cpf', 'endereco', 'tel123123123');
System.debug(cliente.nome + ' ' + cliente.cpf + ' ' + cliente.endereco + ' ' + cliente.telefone);

Produto p1 = new Produto('arroz', 10.0);
Produto p2 = new Produto('feijao', 10.0);
List<Produto> prod = new List<Produto>();
prod.add(p1);
prod.add(p2);
Restaurante restaurante = new Restaurante('nome', 'endereco', CategoriaRestaurante.PIZZARIA, prod);

System.debug(restaurante.nome + ' ' + restaurante.endereco + ' ' + restaurante.categoria + ' ' + restaurante.cardapio[0].nome + ' ' + restaurante.cardapio[0].preco);