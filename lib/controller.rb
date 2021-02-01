require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
  erb :index, locals: {gossips: Gossip.all}
  end
  # Afficher la page gossip new
  get '/gossips/new/' do
    erb :new_gossip
  end
  # Afficher deux inputs name et gossip a remplir dans la page new gossip et faire un redirect home page après avoir submit
  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end
  # Aller dans une page gossip en dyn.url
  get '/gossips/:id' do
  erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end
  # Aller chercher la page édit
  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end
  # Afficher le formulaire dans la page édit
  post '/gossips/:id/edit' do
    Gossip.update(params['id'].to_i, params['gossip_author'], params['gossip_content'])
    redirect '/'
  end

end 