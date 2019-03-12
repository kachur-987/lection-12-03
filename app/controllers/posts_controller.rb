class PostsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_post, except: [:index, :create]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end 
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
    
  private

    def post_params
      params.require(:post).permit(:user_id, :title, :body)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
end

