class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    if @post.save
      flash[:notice] = 'post was successfully created.'
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def posts_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
