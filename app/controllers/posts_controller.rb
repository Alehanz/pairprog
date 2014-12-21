class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
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

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
