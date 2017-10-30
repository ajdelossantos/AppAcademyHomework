require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  # RSPEC RAILS API

  # Navigation
  #   get
  #   post
  #   patch
  #   delete

  # Assertions
  #   render_template
  #   redirect_to
  #   have_http_status, be_success

# IDEA Use this pattern
# post :creates, params: { user: { email: "test@example.com", password: "password" } }

  describe "GET #new" do
    it "renders the new template" do
      get :new, {} # no params
      expect(response).to render_template("new")
    end
  end

  #TODO need help with errors
    #  ActionController::UrlGenerationError:
    #   No route matches {:action=>"creates", :controller=>"users",
    #       :user=>{:email=>"test@example.com", :password=>"password"}}

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :creates, params: { user: { email: "test@example.com", password: "password" } }
        expect(response).to render_template("new")
      end

      it "validates that the password is at least 6 characters long" do
        post :creates, params: { user: { email: "test@example.com", password: "password" } }
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post :creates, params: { user: { email: "test@example.com", password: "password" } }
        #TODO Unnecessary
        # expect(response).to have_http_status(300)
        expect(response).to redirect_to(bands_url)
      end
    end
  end
end
