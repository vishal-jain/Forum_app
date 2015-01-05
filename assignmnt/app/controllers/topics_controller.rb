class TopicsController < ApplicationController
  
#for loading can can abiliites for roles and manegment
 load_and_authorize_resource 

  before_filter :find_forum
  
  def index
    @topics = @forum.topics

    respond_to do |format|
      format.html
      format.json { render json: @topics }
    end
  end

  def show
    #raise params.inspect 
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build
    @comments = @topic.comments

    respond_to do |format|
      format.html
      format.json { render json: @topic }
    end
  end

  def new
    @topic = @forum.topics.build
    respond_to do |format|
      format.html
      format.json { render json: @topic }
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = @forum.topics.build(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to forum_topics_path(@forum), notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to forum_topics_path(@forum), notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to forum_topics_path(@forum) }
      format.json { head :no_content }
    end
  end

  def find_forum    
    @forum = Forum.find(params[:forum_id])
  end
end
