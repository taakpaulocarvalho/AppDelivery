public with sharing class Produto extends EntidadeBase{
    
    public String nome { get; private set; }
    public Dinheiro precoBase { get; private set; }
    public PoliticaDePreco politicaDePreco { get; private set; }

    public Produto(){
        super();
    }

    public Produto(String nome, Dinheiro precoBase, PoliticaDePreco politicaDePreco){
        super();
        this.nome = nome;
        this.precoBase = precoBase;
        this.politicaDePreco = politicaDePreco;
    }

    public Dinheiro calcularPrecoFinal(){
        return this.politicaDePreco.calcularPreco(this);
    }

    public void alterarPoliticaDePreco(PoliticaDePreco politicaDePreco){
        if (politicaDePreco == null){
            throw new IllegalArgumentException('Politica de preco nao pode ser nula!');
        }

        this.politicaDePreco = politicaDePreco;
    }
}