class IndexController < ApplicationController
  layout false

  def index
    @posts = Post .all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to 'show'
    else
      render 'edit'
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id]).destroy
    redirect_to 'index'
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end

end
