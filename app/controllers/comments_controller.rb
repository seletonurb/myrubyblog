class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end
end

