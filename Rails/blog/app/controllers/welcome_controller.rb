class WelcomeController < ApplicationController
   def index
    @articulos=Article.all
   end
end