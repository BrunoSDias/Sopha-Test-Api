class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'Usuário Cadastrado.' }
  end

  def register_failed
    render json: { message: "Falha ao registrar usuário !" }
  end
  
end