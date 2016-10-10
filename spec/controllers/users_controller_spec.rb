require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "render new user template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      create_luke
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    context "given valid inpput" do
      it "logs in the user" do
        post :create, user: {username: "luke", password: "password"}
        user = User.find_by_username("luke")
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects to the user show page" do
        post :create, user: {username: "luke", password: "password"}
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context "given invalid inpput" do
      it "renders the new user page" do
        post :create, user: {username: "", password: ""}
        expect(response).to render_template("new")
      end
    end
  end
end
