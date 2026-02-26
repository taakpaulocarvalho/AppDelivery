public with sharing class Restaurante {
    
    public String nome { get; set; }
    public String endereco { get; set; }
    public CategoriaRestaurante categoria { get; set; }
    public List<Produto> cardapio { get; set; }
    
    public Restaurante(){
        this.cardapio = new List<Produto>();
    }

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria, List<Produto> cardapio){
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = (cardapio == null) ? new List<Produto>() : cardapio;
    }
}