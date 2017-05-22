class PostsController < ApplicationController

before_action :signed_in?, only: [:new,:create]

  def new
  	@post = Post.new
  	
  end

  def index
@posts = Post.all
current_user

  end
def create
@post=Post.create(post_params)
@author = current_user.name 
@post.update_attribute(:user_id, current_user.id)

if @post.save

redirect_to posts_path

else

render 'new'	

end
end
private

def post_params

params.require(:post).permit(:title,:content)
end	

end
