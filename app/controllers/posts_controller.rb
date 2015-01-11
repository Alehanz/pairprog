class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 30).
      order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at ASC")
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      flash[:alert]
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated!"
      redirect_to @post
    else
      flash[:alert]
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to "/"
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :bootsy_image_gallery_id)
  end
end
