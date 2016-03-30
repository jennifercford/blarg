class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at).page params[:page]
    render :index
    #render :index, locals: { posts: posts }
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    # new_post = Post.create(title: params["title"],
    #                        content: params["content"])
    @post = Post.new(title: params["title"],
                     content: params["content"])
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    # get that post out of the database
    post = Post.find(params["id"])
    render :edit, locals: { post: post } #passes the id param to template and attached data to form

  end

  def update
    #binding.pry
    post = Post.find(params["id"])
    post.update(title: params["title"], content: params["content"])

    redirect_to :root #redirects to root path can also be written redirect_to root_path
  end

  def show
    # post = Post.find(params["id"])
    # render :show, locals: {post: post}
    @post = Post.find(params["id"])
    render :show  #this does same as above.
  end

  def destroy
    post = Post.find(params["id"])
    post.destroy
    redirect_to :root
  end
end
