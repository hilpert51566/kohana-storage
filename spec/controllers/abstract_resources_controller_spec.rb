require 'rails_helper'


# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
# RSpec.describe "nested requests", :type => :request do
#
#   describe "GET #index" do
#     it "gets all posts" do
#       get "/posts"
#       expect(assigns(:posts)).not_to eq([])
#     end
#
#     it "gets all posts to a user" do
#       user = User.create(login: 'fisk')
#       post = Post.create(user: user, title: 'fisk')
#       get user_posts_path(user_id: user.id)
#       expect(@controller.parent?).to eq true
#       expect(@controller.resources_url).to eq "/users/1/posts"
#       expect(@controller.resources.first).to eq (post)
#     end
#
#   end
#
# end
RSpec.describe "testing resource_url - for nested requests", type: :request do
  describe "nested other ACTION" do
    it "/users/1/print" do
      user = User.create! id: 1, login: "test"
      get "/users/1/print"
      expect(@controller.resource_url).to eq("/users/1?ids=[\"1\"]")
    end
    it "/users/1/posts/1print" do
      user = User.create! id: 1, login: "test"
      post = Post.create! id: 1, user_id: user.id, title: "test"
      get "/users/1/posts/1/print"
      expect(@controller.resource_url).to eq("/users/1/posts/1?user_id=1&ids=[\"1\"]")
    end
    it "/admin/users/1/posts/1/print" do
      user = User.create! id: 1, login: "test"
      post = Post.create! id: 1, user_id: user.id, title: "test"
      get "/admin/users/1/posts/1/print"
      expect(@controller.resource_url).to eq("/admin/users/1/posts/1?user_id=1&ids=[\"1\"]")
    end
    it "/admin/users/1/edit" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1/edit"
      expect(@controller.resource_url).to eq("/admin/users/1")
    end
  end
  describe "nested EDIT" do
    it "/users/1/posts/1/edit" do
      user = User.create! id: 1, login: "test"
      post = Post.create! id: 1, user_id: user.id, title: "test"
      get "/users/1/posts/1/edit"
      expect(@controller.resource_url).to eq("/users/1/posts/1?user_id=1")
    end
    it "/admin/users/1/edit" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1/edit"
      expect(@controller.resource_url).to eq("/admin/users/1")
    end
    it "/users/1/edit" do
      user = User.create! id: 1, login: "test"
      get "/users/1/edit"
      expect(@controller.resource_url).to eq("/users/1")
    end
    it "/admin/users/1/edit?q=mx" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1/edit?q=mx"
      expect(@controller.resource_url).to eq("/admin/users/1?q=mx")
    end
  end
  describe "nested GET" do
    it "/users/1/posts/1" do
      user = User.create! id: 1, login: "test"
      post = Post.create! id: 1, user_id: user.id, title: "test"
      get "/users/1/posts/1"
      expect(@controller.resource_url).to eq("/users/1/posts/1?user_id=1")
    end
    it "/admin/users/1" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1"
      expect(@controller.resource_url).to eq("/admin/users/1")
    end
    it "/users/1" do
      user = User.create! id: 1, login: "test"
      get "/users/1"
      expect(@controller.resource_url).to eq("/users/1")
    end
    it "/admin/users/1?q=mx" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1?q=mx"
      expect(@controller.resource_url).to eq("/admin/users/1?q=mx")
    end
  end
end

RSpec.describe "testing resources_url - for nested requests", type: :request do
  describe "nested EDIT" do
    it "/users/1/posts/1/edit" do
      user = User.create! id: 1, login: "test"
      post = Post.create! id: 1, user_id: user.id, title: "test"
      get "/users/1/posts/1/edit"
      expect(@controller.resources_url).to eq("/users/1/posts?user_id=1")

    end
    it "/admin/users/1/edit" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1/edit"
      expect(@controller.resources_url).to eq("/admin/users")
    end
    it "/users/1/edit" do
      user = User.create! id: 1, login: "test"
      get "/users/1/edit"
      expect(@controller.resources_url).to eq("/users")
    end
    it "/admin/users/1/edit?q=mx" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1/edit?q=mx"
      expect(@controller.resources_url).to eq("/admin/users?q=mx")
    end
  end
  describe "nested GET" do
    it "/users/1/posts" do
      user = User.create! id: 1, login: "test"
      get "/users/1/posts"
      expect(@controller.resources_url).to eq("/users/1/posts?user_id=1&ids=[]&perpage=20&page=1")

    end
    it "/users/1/posts/1" do
      user = User.create! id: 1, login: "test"
      post = Post.create! id: 1, user_id: user.id, title: "test"
      get "/users/1/posts/1"
      expect(@controller.resources_url).to eq("/users/1/posts?user_id=1")

    end
    it "/admin/users" do
      get "/admin/users"
      expect(@controller.resources_url).to eq("/admin/users?ids=[]&perpage=20&page=1")
    end
    it "/admin/users/1" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1"
      expect(@controller.resources_url).to eq("/admin/users")
    end
    it "/users/1" do
      user = User.create! id: 1, login: "test"
      get "/users/1"
      expect(@controller.resources_url).to eq("/users")
    end
    it "/admin/users/1?q=mx" do
      user = User.create! id: 1, login: "test"
      get "/admin/users/1?q=mx"
      expect(@controller.resources_url).to eq("/admin/users?q=mx")
    end
  end
end


# RSpec.describe Admin::UsersController, type: :controller do
#
#
# end

RSpec.describe UsersController, type: :controller do


  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {id: 1,login:'mos'}
  }

  let(:invalid_attributes) {
    {surname: 'mikkel',slogan: false}
  }

  let(:valid_post) {
    {title: 'post', user_id: 1}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all users as @resources" do
  #     user = User.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:resources)).to eq([user])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested user as @resource" do
  #     user = User.create! valid_attributes
  #     get :show, {:id => user.to_param}, valid_session
  #     expect(assigns(:resource)).to eq(user)
  #   end
  # end
  #
  #
  # describe "GET #new" do
  #   it "assigns a new user as @resource" do
  #     get :new, {}, valid_session
  #     expect(assigns(:resource)).to be_a_new(User)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested user as @resource" do
  #     user = User.create! valid_attributes
  #     get :edit, {:id => user.to_param}, valid_session
  #     expect(assigns(:resource)).to eq(user)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new User" do
  #       expect {
  #         post :create, {:user => valid_attributes}, valid_session
  #       }.to change(User, :count).by(1)
  #     end
  #
  #     it "assigns a newly created user as @resource" do
  #       post :create, {:user => valid_attributes}, valid_session
  #       expect(assigns(:resource)).to be_a(User)
  #       expect(assigns(:resource)).to be_persisted
  #     end
  #
  #     it "redirects to the list of users, as @resources" do
  #       post :create, {:user => valid_attributes}, valid_session
  #       expect(response).to redirect_to(users_url)
  #     end
  #   end
  #
  #   # with Rails 4.x strong_parameters and Responders, forms with invalid attributes
  #   # will silently fail - thus depriving haxors any idea of the issues
  #   #
  #   # context "with invalid params" do
  #   #   it "assigns a newly created but unsaved user as @user" do
  #   #     post :create, {:user => invalid_attributes}, valid_session
  #   #     expect(assigns(:resource)).to be_a_new(User)
  #   #   end
  #   #
  #   #   it "re-renders the 'new' template" do
  #   #     post :create, {:user => invalid_attributes}, valid_session
  #   #     expect(response).to render_template("new")
  #   #   end
  #   # end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       { login: 'mil'}
  #     }
  #
  #     it "updates the requested @resource" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => new_attributes}, valid_session
  #       user.reload
  #       expect(user.login).to eq('mil')
  #     end
  #
  #     it "assigns the requested user as @resource" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
  #       expect(assigns(:resource)).to eq(user)
  #     end
  #
  #     it "redirects to list of users" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
  #       expect(response).to redirect_to(users_url)
  #     end
  #   end
  #
  #   # with Rails 4.x strong_parameters and Responders, forms with invalid attributes
  #   # will silently fail - thus depriving haxors any idea of the issues
  #   #
  #   context "with invalid params" do
  #     it "assigns the user as @resource" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
  #       expect(assigns(:resource)).to eq(user)
  #     end
  #   #
  #   #   it "re-renders the 'edit' template" do
  #   #     user = User.create! valid_attributes
  #   #     put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
  #   #     expect(response).to render_template("edit")
  #   #   end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => user.to_param}, valid_session
  #     }.to change(User, :count).by(-1)
  #   end
  #
  #   it "redirects to the users list" do
  #     user = User.create! valid_attributes
  #     delete :destroy, {:id => user.to_param}, valid_session
  #     expect(response).to redirect_to(users_url)
  #   end
  # end


  describe "inherited methods to verify resources, classes and names"  do


    # it "any action should respond to parent?" do
    #   get :index
    #   expect(@controller.parent?).to eq(false)
    # end
    #
    # it "any action should respond to resource" do
    #   get :new
    #   expect(@controller.resource).not_to eq(nil)
    # end
    #
    # it "index action should respond to resources" do
    #   get :index
    #   expect(@controller.resources).not_to eq(nil)
    # end
    #
    # it "any action should respond to resource_class" do
    #   get :new
    #   expect(@controller.resource_class).to eq(User)
    # end
    #
    # it "any action should respond to resource_name" do
    #   get :new
    #   expect(@controller.resource_name).to eq('users')
    # end
    #
    # it "any action should respond to parent_class" do
    #   get :new
    #   expect(@controller.parent_class).to eq(NilClass)
    # end
    #
    # it "should return a url on the resource" do
    #   user = User.create! valid_attributes
    #   response = get :show, {:id => user.to_param, murky: '2'}, valid_session
    #   expect(@controller.resource_url).to eq "/users/#{user.id}?murky=2"
    # end
    #
    # it "should return a url on the resources" do
    #   user = User.create! valid_attributes
    #   get :index, {:id => user.to_param}, valid_session
    #   expect(@controller.resources_url).to eq "/users"
    # end

  end



end
