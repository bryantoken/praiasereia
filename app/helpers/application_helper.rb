module ApplicationHelper
  require 'cpf_utils'
  # require 'numero'

  def validar_cpf(cpf)
    CpfUtils.valid_cpf?(cpf)
  end

  # def validar_numero(celular)
  #   Numero.valid_number?(celular)
  # end
  def caixa_alta(texto)
    texto.upcase
  end
  def formatar_cpf(cpf)
    cpf.to_cpf_format
  end
end

