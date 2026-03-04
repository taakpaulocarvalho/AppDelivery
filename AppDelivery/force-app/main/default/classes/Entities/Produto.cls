public with sharing class Produto extends EntidadeBase{
    
    public String nome { get; private set; }
    public Dinheiro preco { get; private set; }

    public Produto(){
        super();
    }

    public Produto(String nome, Dinheiro preco){
        super();
        this.nome = nome;
        this.preco = preco;
    }
}