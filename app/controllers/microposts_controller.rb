class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "micropost ------- created"
      redirect_to root_url

    else
      # @feed_items = current_user.microposts.limit(5).order('id desc')
      # @feed_items = @feed_items.limit(@feed_items.size - 1)
      # @feed_items = @feed_items.paginate(:page => 1)
      @feed_items = []
      render 'static_pages/home'

    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end


  private
    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
