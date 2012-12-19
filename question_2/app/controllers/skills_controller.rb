# coding: utf-8
class SkillsController < ApplicationController
  def create
    @publication = Publication.find params[:publication_id]
    @skilltag = Skilltag.where(name: params[:skilltag]).first_or_create!
    @publication.skilltags << @skilltag
    redirect_to @publication, notice: "#{@publication.title}のスキルに#{@skilltag.name}を追加しました"
  end
end
