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

  def add_author
    @publication = Publication.find params[:id]

    if @publication.users << current_user
      redirect_to @publication, notice: "#{@publication.title}の著者にあなたを追加しました"
    else
      redirect_to @publication, notice: "#{@publication.title}の著者にあなたを追加できませんでした。"
    end
  end

  def add_skilltag
    @publication = Publication.find params[:id]
    @skilltag = Skilltag.where(name: params[:skilltag]).first_or_create!

    if @publication.skilltags << @skilltag
      redirect_to @publication, notice: "#{@publication.title}のスキルに#{@skilltag.name}を追加しました"
    else
      redirect_to @publication, notice: "#{@publication.title}のスキルに#{@skilltag.name}を追加できませんでした"
    end
  end
end
