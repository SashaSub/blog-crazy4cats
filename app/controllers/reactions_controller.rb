class ReactionsController < ApplicationController
    before_action :authenticate_user!

    def new_user_reaction
        @post = Post.find(params[:post_id])        
        @user = current_user
        @kind = params[:kind]      
        old_reaction = Reaction.find_by(user_id: @user.id, post_id: @post.id)
        if old_reaction                
            redirect_to post_path(@post.id), notice: "You've already expressed your feelings"
        else
            @reaction = Reaction.new(user_id: @user.id, post_id: @post.id, kind: @kind)
            respond_to do |format|
                if @reaction.save
                    format.html { redirect_to post_path(@post.id), notice: 'Reaction was successfully added.' }
                else
                    format.html { redirect_to post_path(@post.id), notice: 'Reaction was not added.' }
                end
            end
        end
    end

    # def post_with_reactions
    #     @reactions = current_user.reactions
    #     post_ids = @reactions.map(&:post_id)
    #     @posts = Post.where(id: post_ids)
    # end

end
