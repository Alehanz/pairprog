class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to post_path(@post)
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body, :bootsy_image_gallery_id)
  end
end
