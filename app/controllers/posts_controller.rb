class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new

  end
  def create

  end
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :author_id)
  end
  def edit

  end
  def update

  end
  def show
    @post = Post.find(params[:id])
  end
  def destroy

  end

end
