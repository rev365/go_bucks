module GoBucks
  class WalletsController < ::ApplicationController
    def show
      @wallet = GoBucks::Wallet.find_by(user: current_user)
      render :layout => false
    end

    def create
      @wallet = GoBucks::Wallet.find_or_create_by(user: current_user)
      render :show, layout: false
    end

    def reward
      @rewardee = User.find_by(email: params[:email])
      @transfer = Transfer.new(from: current_user, to: @rewardee, amount: 1)

      if @transfer.save
        flash[:alert] = @transfer.errors.full_messages.first
      else
        flash[:notice] = "Transfer success"
      end
        
      redirect_back fallback_location: go_bucks_path
    end
  end
end
