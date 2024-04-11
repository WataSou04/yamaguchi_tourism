class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_review_path(@comment.review_id)
  end
end
