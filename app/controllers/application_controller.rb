require_relative '../../config/environment'
require_relative '../models/Post.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find_by(id:params[:id])
    erb :show
  end

  post '/posts' do
    @post = Post.create(params)    
    erb :index
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id/edit' do
    @post=Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post=Post.find_by(id: params[:id]) 
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end
  
  delete '/posts/:id/delete' do
    @post=Post.find_by(id: params[:id])
    @post.destroy
    erb :deleted
  end

end