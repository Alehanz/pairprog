require 'rails_helper'

describe PostsController, :type => :controller do

  describe "#create" do
    before(:each) do
      @user = create(:user)
    end

    it "creates a new post" do
      allow(controller).to receive(:sign_in)

      post :create, { id: @user.id, post:
                      { title: "Title",
                        description: "Description"
                      }
                    }


      expect(Post.count).to eq(1)
    end

  end

  describe "#update" do
    before(:each) do
      @user = create(:user)
      @post = create(:post)
      @post.user_id = @user.id
    end

    it "updates post with valid info" do
      allow(controller).to receive(:sign_in)

      put :update, { id: @post.id, post:
                      { title: nil,
                        description: nil
                      }
                    }


      expect(response).to render_template(:edit)
    end

    it "redirect to edit_path if info is invalid" do
      allow(controller).to receive(:sign_in)

      put :update, { id: @post.id, post:
                      { title: nil,
                        description: nil
                      }
                    }

      expect(response).to render_template(:edit)
    end
  end

end
