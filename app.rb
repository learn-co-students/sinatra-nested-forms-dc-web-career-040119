require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here

 #    configure do
	#   set :views, ['views', 'views/pirates']
	# end

	# helpers do
	#   def find_template(views, name, engine, &block)
 # 	   	views.each { |v| super(v, name, engine, &block) }
	#   end
	# end

    get '/' do 

    	erb :root
    end

    get '/new' do 

    	erb :"pirates/new"
    end 

    post '/pirates' do 

    	@pirate = Pirate.new(params[:pirate])
    	
    	params[:pirate][:ships].each do |ship_info|
    		Ship.new(ship_info)
    	end

    	@ships = Ship.all 

    	erb :"pirates/show"
    end

  end
end
