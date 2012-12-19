# coding: utf-8
class AuthorshipsController < ApplicationController
  def create
    publication = Publication.find params[:publication_id]
    publication.users << current_user
    redirect_to publication, notice: "#{publication.title}の著者にあなたを追加しました"
  end
end
