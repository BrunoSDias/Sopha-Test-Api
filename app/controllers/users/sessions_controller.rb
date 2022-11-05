class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    render json: { message: 'Usuário Logado.' }, status: :ok
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: "Usuário Deslogado" }, status: :ok
  end

  def log_out_failure
    render json: { message: "Falha ao logar"}, status: :unauthorized
  end
  
end