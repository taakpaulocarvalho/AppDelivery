public with sharing class Produto extends EntidadeBase{
    
    public String nome { get; set; }
    public Decimal preco { get; set; }

    public Produto(){
        super();
    }

    public Produto(String nome, Decimal preco){
        super();
        this.nome = nome;
        this.preco = preco;
    }
}