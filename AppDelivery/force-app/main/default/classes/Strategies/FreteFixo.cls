public with sharing class FreteFixo implements PoliticaDeFrete {
    
    private Dinheiro valorFixo;

    public FreteFixo(Dinheiro valorFixo){
        this.valorFixo = valorFixo;
    }

    public Dinheiro calcularFrete(Pedido pedido){
        return this.valorFixo;
    }
}