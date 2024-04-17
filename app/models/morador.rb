class Morador < ApplicationRecord
  self.table_name = 'MORADORES'
  alias_attribute :cpf, :CPF
  alias_attribute :nome, :NOME
  alias_attribute :celular, :CELULAR
  alias_attribute :bloco, :BLOCO
  alias_attribute :apartamento, :APARTAMENTO

  def self.ransackable_attributes(auth_object = nil)
    ["cpf", "nome", "celular", "bloco", "apartamento"]
  end

  def self.ransackable_associations(auth_object = nil)
    [] # Deixe vazio se o modelo Morador não tiver associações com outros modelos
  end
end
