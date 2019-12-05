class BlogsController < OpenReadController
  before_action :set_blog, only: %i[show]

  # GET /blogs
  def index
    @blogs = Blog.all
    # @blogs = current_user.blogs.all

    render json: @blogs
  end

  # GET /blogs/1
  def show
    render json: @blog
  end

  # POST /blogs
  def create
    # @blog = Blog.new(blog_params) (can only create in current user's account)
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    @blog = current_user.blogs.find(params[:id])
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
      # @blog = current_user.blogs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:category, :title, :content, :user_id)
    end
end
