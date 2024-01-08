# frozen_string_literal: true

require "rails_helper"

RSpec.describe CustomRegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "POST #create" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    let(:valid_params) do
      { email: "test@example.com", password: "password123", password_confirmation: "password123", name: "John" }
    end
    let(:invalid_params) do
      { email: "test@example.com", password: "password123", password_confirmation: "wrongpassword", name: "" }
    end

    context "with valid parameters" do
      it "creates a new user" do
        expect do
          post :create, params: valid_params
        end.to change(User, :count).by(1)

        expect(response).to have_http_status(200)
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable_entity status" do
        post :create, params: { user: invalid_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include("errors")
      end
    end
  end
end
