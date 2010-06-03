class CommentsController < ApplicationController
  before_filter :filter_able_type
  private
  # filter access by type
  def filter_able_type
    allow_type = ["Post"]
    pcomment = params[:comment]
    if not (allow_type.index(params[:commentable_type]) or allow_type.index(pcomment[:commentable_type]))
      respond_to do |format| 
        format.html {
          render_404
        }
        format.js { render :text => "参数错误." }
      end
    end
  end

  public
  def index
    @comment = Comment.new(:commentable_type => params[:commentable_type],
                           :commentable_id => params[:commentable_id])
    @comments = Comment.find_all_by_commentable_type_and_commentable_id(params[:commentable_type],
                                                                        params[:commentable_id], 
                                                                        :order => "id desc", :include => [:user])
    render :layout => false
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = @current_user.id 
    if @comment.save
      respond_to do |format|
        format.html { 
          notice_success("评论提交成功。")
          redirect_to post_path(@comment.commentable)
        }
        format.js { render :layout => false}
      end
    else
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end

  def destroy
  end
end
