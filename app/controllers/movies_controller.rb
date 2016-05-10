class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show

    #    require "pry"
    #   binding.pry
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create


    #    require "pry"
    #    binding.pry
    @movie = Movie.new(:name => params[:movie][:name],:price => params[:movie][:price])
    if @movie.save
      redirect_to movie_path(@movie)   # Rails is 'smart' enough to also do => 'redirect_to @tool'
    else
      render :new
    end
  end

  def edit

   # require "pry"
   # binding.pry
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(:name => params[:movie][:name],:price => params[:movie][:price])
    redirect_to movie_path(movie)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.delete
    redirect_to movies_path
  end


end


