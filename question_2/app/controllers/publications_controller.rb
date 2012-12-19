# coding: utf-8
class PublicationsController < ApplicationController
  def index
    @publications = Publication.order('created_at desc').page(params[:page]).per(10)
  end

  def show
    @publication = Publication.find params[:id]
  end

  def new
    @publication = Publication.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @publication = Publication.create! params[:publication]
        @publication.users << current_user
      end
    rescue ActiveRecord::RecordInvalid
      return render 'new'
    end
    redirect_to @publication, notice: "#{@publication.title}を登録しました"
  end
end
