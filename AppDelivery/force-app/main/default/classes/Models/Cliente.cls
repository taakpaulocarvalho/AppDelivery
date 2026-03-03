public with sharing class Cliente extends EntidadeBase{
    
    public String nome { get; set; }
    public String cpf { get; set; }
    public String endereco { get; set; }
    public String telefone { get; set; }

    public Cliente(String nome, String cpf, String endereco, String telefone){
        super();
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }
}