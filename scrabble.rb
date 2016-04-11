require 'sinatra'
require_relative 'lib/scrabble_sinatra'
require 'pry'

class Scrabble < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  get '/score/:word' do
    @score_hash = Scoring.score(params[:word])
    erb :score
  end

  post '/score' do
    @score_hash = Scoring.score(params["word"])
    erb :score
  end

  get '/score-many' do
    @number_words = 0
    @words_with_score = {}
    erb :score_many
  end

  post '/score-many' do
    @number_words = params["number"].to_i
    @new_words = params["game"]
    @words_with_score = {}
    @new_words.each do |word|
      @words_with_score[word] = Scoring.score(word.gsub(/[^a-zA-Z]/,""))
    end
    erb :score_many
  end

  run!
end
