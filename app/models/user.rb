# frozen_string_literal: true

class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :stores, dependent: :destroy

  validates :name, presence: true

  after_create :confirm_email

  private
  # Tivemos que adicionar um método para confirmar o email
  # O SeS da AWS só envia emails de confirmação para os que estão verificados
  # Porque ainda estamos em ambiente sandbox e precisa de uma analise para passar pra produção
  # Para fins de teste adicionamos a confirmação automática
  
  # obs: Tirar o confirmable do devise não necessariamente resolve todas pendencias para que a aplicação
  # não tente verificar o email. Então deixamos o confirmable e as colunas no user e pós analise podemos configurar o SeS 
  # e remover o método
  def confirm_email
    self.confirmed_at = DateTime.now
  end
end
