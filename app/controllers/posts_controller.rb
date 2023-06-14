class PostsController < ApplicationController
  def view_posts
    debugger
  end
  
  def view_one_post
  end
  
  def view_feed
    @posts = Post.all.order('created_at DESC')
    # @posts = Array.new
    # @posts.append(Post.find(1))
    # @posts.append(Post.find(2))
    @users = User.all
    #debugger
  end

  def new_post
    @post = Post.new
  end

  def add_post
    @post = Post.new
    @post.image = params[:post][:image]
    @post.caption = params[:post][:caption]
    @post.user_id = Current.user.id
    #debugger
    if @post.save
      flash[:notice] = 'Post successfully Uploaded'
      redirect_to feed_path
    else
      flash[:alert] = 'Something went wrong with Post'
      render 'new_post'
    end
  end

end