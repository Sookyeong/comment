class HomeController < ApplicationController
  
  def index
    
    @posts = Post.all.reverse
  
  end
  
  def post_write
    
    new_post = Post.new
    new_post.post_title = params[:view_post_title]
    new_post.post_content = params[:view_post_content]

    new_post.save
    
    redirect_to "#"
    
  end
  
  def destory
    @one_post = Post.find(params[:post_id])
    @one_post.destory
    
    redirect_to '/'
  end
  
  def update_view
    @one_post = Post.find(params[:post_id])
  end
  
  def update_write
    @one_post = Post.find(params[:post_id])
    
    @one_post.title = params[:view_post_title]
    @one_post.cotent = params[:view_post_content]
    
    @one_post.save
    
    redirect_to '/'
  end
  
  def comment_write
    
    new_comment = Comment.new
    new_comment.comment_content = params[:view_comment_content]
    new_comment.post_id = params[:view_post_id]
    
    new_comment.save
    
    redirect_to :back
    
  end
  
end
