require 'rails_helper'

describe PostsController, :type => :controller do

  describe "#create" do
    before(:each) do
      @user = create(:user)
    end

    it "creates a new post" do
      allow(controller).to receive(:sign_in)

      post :create, default_params

      expect(Post.count).to eq(1)
    end

  end

  describe "#update" do
    before(:each) do
      @user = create(:user)
      @post = create(:post)
    end

    it "updates post with valid info" do
      allow(controller).to receive(:sign_in)

      post :update, default_params

      expect(response).to redirect_to post_path
    end

    it "redirect to edit_path if info is invalid" do
      allow(controller).to receive(:sign_in)

      post :update, { id: @user.id, post:
                      { title: nil,
                        description: nil
                      }
                    }

      expect(response).to render_template(:edit)
    end
  end

  def default_params
    { id: @user.id, post:
      {
        title: "Post title",
        description: "Post description" 
      }
    }
  end

end
