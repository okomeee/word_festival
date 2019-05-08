class HomesController < ApplicationController

  def index
    @posts = Post.all.sample(100)
    @post = Post.new
    @count = Post.count
  end

  def note
    @posts = Post.all.shuffle
    @msg = ""
    @posts.each{|post| @msg = @msg + " " + post.word }
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, flash: { success: 'ｷﾀ━━━━(ﾟ∀ﾟ)━━━━!!' } }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path, flash: { warning: 'きゃ━(;´༎ຶД༎ຶ`)━っっ!!!(失敗...)' } }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:word)
    end

end
