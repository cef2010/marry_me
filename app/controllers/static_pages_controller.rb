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
    if verify_recaptcha
      @contact.save
      flash[:notice] = 'Thanks for contacting us. Someone will contact you
                       shortly.'
      redirect_to controller: 'static_pages', action: 'home', flag: true
    else
      flash[:error] = 'There was an error'
      render 'contact'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
