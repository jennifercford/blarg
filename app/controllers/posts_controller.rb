class PostsController < ApplicationController
  def index
    posts = Post.all
    render :index, locals: { posts: posts }
  end

  def new
    render :new
  end

  def create
    new_post = Post.create(title: params["title"],
                           content: params["content"])
    redirect_to :root
  end

  def edit
    # get that post out of the database
    post = Post.find(params["id"])
    render :edit, locals: { post: post }

  end

  def update
    #binding.pry
    post = Post.find(params["id"])
    post.update(title: params["title"], content: params["content"])

    redirect_to :root
  end

  def show
    post = Post.find(params["id"])
    render :show, locals: {post: post}

  end
end
