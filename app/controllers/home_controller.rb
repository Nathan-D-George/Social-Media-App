class HomeController < ApplicationController
    def home
    end

    def about
    end
    
    def secret
        flash.now[:notice] = 'Well done on reaching the real secret room'
    end
    
    def fakesecret
        flash.now[:alert] = 'Not the real secret room'
    end
end