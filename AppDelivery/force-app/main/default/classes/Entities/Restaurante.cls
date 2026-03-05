public with sharing class Restaurante extends EntidadeBase{
    
    public String nome { get; private set; }
    public Endereco endereco { get; private set; }
    public CategoriaRestaurante categoria { get; private set; }
    public List<Produto> cardapio { get; private set; }
    
    public Restaurante(){
        super();
        this.cardapio = new List<Produto>();
    }

    public Restaurante(String nome, Endereco endereco, CategoriaRestaurante categoria, List<Produto> cardapio){   
        super();
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = (cardapio == null) ? new List<Produto>() : cardapio;
    }

    public void adicionarProduto(Produto produto){
         
        Boolean produtoExiste = false;

        for (Produto prod : cardapio){
            
            produtoExiste = (prod.nome == produto.nome) ?  true : false;
            if (produtoExiste) break;
        }
        
        if (produtoExiste){
            System.debug('Produto ' + produto.nome + ' ja existe no cardapio!');
        }
        else{
            cardapio.add(produto);
            System.debug(produto +' adicionado com sucesso!');
        }
        
    }

    public void exibirCardapio(){

        if (cardapio == null || cardapio.isEmpty())
            System.debug('Nenhum produto no cardapio!');
        else{
            
            System.debug('CARDAPIO DO RESTAURANTE ' + nome);
        
            for(Integer i = 0; i < cardapio.size(); i++){
                System.debug('Produto ' + (i+1) + ': ' + cardapio[i].nome + ' - R$ ' + cardapio[i].calcularPrecoFinal());
            }
            
            System.debug('FIM DO CARDAPIO');
        }
    }

    public List<Produto> buscarProdutos(String termoBusca){

        List<Produto> produtos = new List<Produto>();

        for (Produto produto : cardapio){

            if (produto.nome.contains(termoBusca)){
                produtos.add(produto);
                System.debug('Produto adicionado!');
            } 
            else{
                System.debug('Produto ' + termoBusca + ' não encontrado!');
            }
        }
        return produtos;
    }
}