require 'rails_helper'

RSpec.describe Auth::SessionsController, type: :controller do
  describe 'GET #new' do
    it 'redirects to the login page if user is not logged in' do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'renders the new template if user is logged in' do
      user = create(:user)
      sign_in user

      get :new

      expect(response).to render_template(:new)
    end
  end
end