class CommentsController < InheritedResources::Base
  def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      ;flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
		else
      flash[:notice] = "Error creating post comment: #{@comment.errors}"
      redirect_to(@comment.post)
		end
  end
end
