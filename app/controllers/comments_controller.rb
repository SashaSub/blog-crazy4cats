class CommentsController < ApplicationController
   # before_action :set_comment, only: %i[ new create show edit update destroy ]
   
    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.new(comment_params)
        if current_user.present? 
           @comment.user = current_user #if current_user || nil
        #else 
          # @comment.user = 
        end
        respond_to do |format|
            if @comment.save
                format.html { redirect_to post_path(@post.id), notice: 'Comment was successfully created.' }
            else
                format.html { redirect_to post_path(@post.id), notice: 'Comment was not created.' }
            end
        end
    end

    def destroy
        @comment.destroy
    
        respond_to do |format|
          format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
          format.json { head :no_content }
        end
    end

   private
    # Use callbacks to share common setup or constraints between actions.
    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end
end
        
