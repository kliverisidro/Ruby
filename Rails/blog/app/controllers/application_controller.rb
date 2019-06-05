class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :cargar_registros
    def cargar_registros
       @categorias=Category.all 
    end
end
