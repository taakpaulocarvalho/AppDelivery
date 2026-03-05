public with sharing class Produto extends EntidadeBase{
    
    public String nome { get; private set; }
    public Dinheiro preco { get; private set; }
    public PoliticaDePreco politicaDePreco { get; private set; }

    public Produto(){
        super();
    }

    public Produto(String nome, Dinheiro preco, PoliticaDePreco politicaDePreco){
        super();
        this.nome = nome;
        this.preco = preco;
        this.politicaDePreco = politicaDePreco;
    }

    public Dinheiro getPreco(){
        return this.politicaDePreco.calcularPreco(this);
    }
}