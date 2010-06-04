class PostsController < ApplicationController
  before_filter :require_user, :only => [:new,:create,:edit,:update]
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => Setting.per_page, :order => "id desc", :include => [:tags, :user])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = @current_user.posts.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = @current_user.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = @current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        notice_success("发布成功。")
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        notice_success("修改成功。")
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    notice_success("删除成功。")
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  # POST /posts/1/vote
  # POST /posts/1/vote.js
  def vote 
    if not @current_user
      notice_warring("必须登录后才可以做此操作。")
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
        format.js { render :layout => false }
      end
      return
    end

    @post = Post.find(params[:id])
    if params[:up] == "1"
      @success = @current_user.vote_for(@post)
    else
      @success = @current_user.vote_against(@post)
    end

    respond_to do |format|
      format.html { 
        if @success
          notice_success("提交成功。")
        else
          notice_warring("每人只有一次机会哦。")
        end
        redirect_to(post_path(@post)) 
      }
      format.js { render :layout => false }
    end
  end
end
