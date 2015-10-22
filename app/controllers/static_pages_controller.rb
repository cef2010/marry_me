class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :body)
    end
end
