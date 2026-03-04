public with sharing class Produto extends EntidadeBase{
    
    public String nome { get; set; }
    public Dinheiro preco { get; set; }

    public Produto(){
        super();
    }

    public Produto(String nome, Dinheiro preco){
        super();
        this.nome = nome;
        this.preco = preco;
    }
}