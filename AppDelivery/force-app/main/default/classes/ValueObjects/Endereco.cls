public with sharing class Endereco {
    
    private final String logradouro;
    private final String complemento;
    private final String numero;
    private final String cidade;

    public Endereco(String logradouro, String numero, String complemento, String cidade){
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.cidade = cidade;
    }

    public Boolean equals(Object obj){
        if (obj != null && (obj instanceof Endereco)){
            Endereco endereco = (Endereco) obj;
            return this.logradouro == endereco.logradouro &&
                   this.numero == endereco.numero &&
                   this.complemento == endereco.complemento &&
                   this.cidade == endereco.cidade;
        }
        return false;
    }

    public Integer hashCode(){
        return System.hashCode(logradouro + numero + complemento + cidade);
    }

    public String getLogradouro(){
        return logradouro;
    }

    public String getNumero(){
        return numero;
    }
    
    public String getComplemento(){
        return complemento;
    }
    
    public String getCidade(){
        return cidade;
    }
}