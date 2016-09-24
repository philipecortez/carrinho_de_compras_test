class CarrinhoDeCompras
  attr_reader :itens
  def initialize
    @itens = []
  end

  def <<(item)
    itens << item
  end

  def maior_valor
    if itens.empty?
      0
    else
      itens.map(&:valor_unitario).max
    end
  end
end
