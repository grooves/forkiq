# coding: utf-8
class PublicationsController < ApplicationController
  def index
    @publications = Publication.includes(:concerns, :publication_comments)
  end
end
