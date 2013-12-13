class ClassifiedsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @categories = Category.order(:name)
  end

  def new
    @classified = Classified.new
    @categories = Category.pluck(:name)
  end

  def create
    safe_classified = params.require(:classified).permit(:title, :description, :price, :image)

    @classified = Classified.new( safe_classified )
    @classified.user = current_user

    @category = params[:category]
    @classified.category = Category.where(:name => @category.capitalize).first_or_create

    @categories = Category.pluck(:name)

    if @classified.save
      redirect_to classified_path(@classified)
    else
      render :new
    end
  end

  def show
    @classified = Classified.find params[:id]
  end
end
