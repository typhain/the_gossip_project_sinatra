require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
  end

  # post '/gossips/new/' do
  # puts "Salut, je suis dans le serveur"
  # puts "Ceci est le contenu du hash params : #{params}"
  # puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  # puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  # puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  # end

  get '/all_gossips/' do
  erb :all_gossips, locals: {gossips: Gossip.all}
  end

end
