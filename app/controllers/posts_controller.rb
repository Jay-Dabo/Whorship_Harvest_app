class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :find_community 
  # before_action :find_user


  # GET /posts
  # GET /posts.json
  def index
    # community_post = Community.find(params[:community_id])
    # @posts = community_post.posts
    @posts = Post.where(:community_id => @community)

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new

  @post = Post.new(:community_id => :community_id)
    
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create

     
     @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to community_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :author,:community_id,:user_id)
    end

    def find_community
       if params[:community_id]
          @community =Community.find(params[:community_id])
          puts @community
        end
    end

    def find_user
       if params[:user_id]
          @user =  User.find(params[:user_id])
          puts params[:user_id] 
        end
    end
end
