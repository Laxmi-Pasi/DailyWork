class BooksController < ApplicationController
  #layout "special_layout"
  layout "special_layout", except: [:index]
  #layout :books_layout
  #head :bad_request
  def index
    @books = Book.all
    #render layout: "index_layout"
    #render inline: "<% @books.each do |p| %><p><%= p.name %></p><% end %>"
   
  end

  def edit
    puts "------------inside--------------edit------------"
    @book=Book.find(params[:id])
    @id=2
    #render inline: "<%= @book.name %>"
    #render inline: "xml.p {'Horrid coding practice!'}", type: :builder
    #render plain: "OK"
    #render html: helpers.tag.strong('Not Found')
    #render json: @book
    #render xml: @book
    #render js: "alert('Hello Rails');" //give errors for security reason not working
    #render body: "raw"
    #render file: "#{Rails.root}/public/404.html", layout: false
    #render Book.form //gives error. Not able to understand
    #render layout: "special_layout"
    #render layout: false
    #render location: "https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30" //not able to understand
    #render status: 500 
    #render formats: :json //errors
    # called in HomeController#index
    #render variants: [:mobile, :desktop]
    #render "page"
  end

  def show
    # @book = Book.find(params[:id])
    # if @book.nil?
    #   render action: "new" and return
    # end
    # render action: "edit"
    @book = Book.find_by(id: params[:id])
    if @book
      @books = Book.all
      flash.now[:alert] = "Your book was not found"
      render "page"
    end
  end
  
  def books_layout
    i=1
    j=1
    #i==j ? "special_layout" : "application"
    i==j ? "application" : "special_layout"
  end

  def update
    puts "------------inside--------------update------------"
    @book = Book.find(params[:id])
    @id=1
    if @book.update(book_params)
      #render action: :show
      redirect_to(@book)
      #render "show"
    else
      #redirect_to edit_book_path(@book)
      render inline: "<% @books.each do |p| %><p><%= p.name %></p><% end %>"
    end
  end

  def book_params
    params.require(:book).permit(:name,:price)
  end
end
