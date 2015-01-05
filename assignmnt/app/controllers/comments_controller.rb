class CommentsController < ApplicationController

#for loading can can abiliites for roles and manegment
 load_and_authorize_resource 

 before_filter :find_forum_topic
  
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end


  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end


  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

 

 
  def create
  begin    
    params[:comment].merge!(:user_id => current_user.id)
    @comment = @topic.comments.build(params[:comment])      
    @topic.reload
    @comments = @topic.comments
      respond_to do |format|
        if @comment.save
          respond_to :js if request.xhr?
          return
        end
      end
  rescue Exception => e
    ap e.message
  end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to forum_topic_path(@forum,@topic) }
      format.json { head :no_content }
    end
  end

  def find_forum_topic
     @topic =Topic.find(params[:topic_id])
     @forum = Forum.find(params[:forum_id])
  end
end
