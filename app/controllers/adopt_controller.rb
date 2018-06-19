class AdoptController < ApplicationController
  def request
    @post = Post.find_by(id: params[:id])
  end
end
