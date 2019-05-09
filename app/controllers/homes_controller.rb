class HomesController < ApplicationController

  def index
    if params[:token] == "7ZRerpJrdSzKzsqm3SFhVcm0cTNhRfqTdhF0pfXHKNDCSgWNqWVXKWT2avXiCjNTbazZ7ovVxJQG4Y-GrFObq_rH0NqMzNs1xLE-_SmX15S-UbjOu8yE6zpssTTWR6lQRwC6kg"
      @posts = Post.all.sample(100)
      @post = Post.new
      @count = Post.count
    else
      redirect_to not_certified_path
    end
  end

  def note
    if params[:token] == "7ZRerpJrdSzKzsqm3SFhVcm0cTNhRfqTdhF0pfXHKNDCSgWNqWVXKWT2avXiCjNTbazZ7ovVxJQG4Y-GrFObq_rH0NqMzNs1xLE-_SmX15S-UbjOu8yE6zpssTTWR6lQRwC6kg"
      @posts = Post.all.shuffle
      @msg = ""
      @posts.each{|post| @msg = @msg + " " + post.word }
    else
      redirect_to not_certified_path
    end
  end

  def create
    if post_params[:token] == "7ZRerpJrdSzKzsqm3SFhVcm0cTNhRfqTdhF0pfXHKNDCSgWNqWVXKWT2avXiCjNTbazZ7ovVxJQG4Y-GrFObq_rH0NqMzNs1xLE-_SmX15S-UbjOu8yE6zpssTTWR6lQRwC6kg"
      @post = Post.new(word: post_params[:word])
      respond_to do |format|
        if @post.save
          format.html { redirect_to root_path(token: "7ZRerpJrdSzKzsqm3SFhVcm0cTNhRfqTdhF0pfXHKNDCSgWNqWVXKWT2avXiCjNTbazZ7ovVxJQG4Y-GrFObq_rH0NqMzNs1xLE-_SmX15S-UbjOu8yE6zpssTTWR6lQRwC6kg"), flash: { success: 'ｷﾀ━━━━(ﾟ∀ﾟ)━━━━!!' } }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { redirect_to root_path(token: "7ZRerpJrdSzKzsqm3SFhVcm0cTNhRfqTdhF0pfXHKNDCSgWNqWVXKWT2avXiCjNTbazZ7ovVxJQG4Y-GrFObq_rH0NqMzNs1xLE-_SmX15S-UbjOu8yE6zpssTTWR6lQRwC6kg"), flash: { warning: 'きゃ━(;´༎ຶД༎ຶ`)━っっ!!!(失敗...)' } }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:word, :token)
    end

end
