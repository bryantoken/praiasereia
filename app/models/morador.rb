class Morador < ApplicationRecord
  validates :cpf, presence: true, length: { minimum: 11, maximum: 11 }
  validates :nome, presence: true, length: { minimun: 3, maximum: 45}
  validates :celular, presence: true, length: {minimun: 11, maximum: 11}
  validates :bloco, presence: true
  validates :apartamento, presence: true
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
    []
  end
end
