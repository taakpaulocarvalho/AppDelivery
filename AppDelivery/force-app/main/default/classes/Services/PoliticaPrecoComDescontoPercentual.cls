public with sharing class PoliticaPrecoComDescontoPercentual implements PoliticaDePreco{

    private Decimal percentual;

    public PoliticaPrecoComDescontoPercentual(Decimal percentual){
        if (percentual == null || percentual <= 0 || percentual > 100){
            throw new IllegalArgumentException('O percentual deve ser maior que zero e menor que 100!');
        }
        
        this.percentual = percentual;
    }

    public Dinheiro calcularPreco(Produto produto){
        Decimal valorDescontar = produto.preco.valorMonetario * (this.percentual / 100);

        return produto.preco.Subtrair(new Dinheiro(valorDescontar));
    }
}