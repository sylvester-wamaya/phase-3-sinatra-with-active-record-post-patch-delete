require_relative './config/environment'

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser
class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    delete '/reviews/:id' do 
        review = Review.find(params[:id])
        review.destroy
        review.to_json
    end
    post '/reviews' do
        review = Review.create(
            score: params[:score],
            comment: params[:comment],
            game_id: params[:game_id],
            user_id: params[:user_id]
        )
        review.to_json
    end
    patch '/reviews/:id' do
        review = Review.find(params[:id])
        review.update(
            score: params[:score],
            comment: params[:comment]

        )
        review.to_json
    end
end
run ApplicationController
