# coding: utf-8
require 'minitest/autorun'
require File.expand_path '../lib/item', File.dirname(__FILE__)
require File.expand_path '../lib/carrinho_de_compras', File.dirname(__FILE__)

class MaiorPrecoTest < Minitest::Unit::TestCase

  def setup
    @carrinho = CarrinhoDeCompras.new
  end
  
  def test_deve_retornar_zero_se_carrinho_vazio
    valor = @carrinho.maior_valor

    assert_equal 0, valor
  end

  def test_deve_retornar_o_item_se_carrinho_com_1_elemento
    @carrinho << Item.new('Geladeira', 1, 900.0)

    valor = @carrinho.maior_valor

    assert_equal 900.0, valor
  end

  def test_deve_retornar_maior_valor_se_carrinho_contem_muitos_elementos
    @carrinho << Item.new('Geladeira', 1, 900.0)
    @carrinho << Item.new('Fogão', 1, 1500.0)
    @carrinho << Item.new('Maquina de Lavar', 1, 750.0)

    valor = @carrinho.maior_valor

    assert_equal 1500.00, valor
  end

  def test_deve_comecar_vazio
    assert_equal 0, @carrinho.itens.size
  end

  def test_deve_ter_n_itens_apos_adicao
    geladeira = Item.new('Geladeira', 1, 900.0)
    @carrinho << geladeira

    assert_equal 1, @carrinho.itens.size
    assert @carrinho.itens.include? geladeira
  end

end
