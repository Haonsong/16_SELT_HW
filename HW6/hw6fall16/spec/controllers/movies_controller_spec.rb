require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do
   it 'should call the model method that performs TMDb search' do
      fake_results = [double('movie1'), double('movie2')]
      expect(Movie).to receive(:find_in_tmdb).with('Ted').
        and_return(fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
    end
    it 'should select the Search Results template for rendering' do
      post :search_tmdb, {:search_terms => 'Ted'}
      expect(response).to render_template('search_tmdb')
    end  
    it 'should make the TMDb search results available to that template' do
      fake_results = [double('Movie'), double('Movie')]
      allow(Movie).to receive(:find_in_tmdb).and_return (fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
      expect(assigns(:movies)).to eq(fake_results)
    end 
    
    it 'should redirect to movies_path if the movie is not in tmdb' do
      fake_results = []
      expect(Movie).to receive(:find_in_tmdb).with('Ted').
        and_return(fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
      expect(response).to redirect_to('/movies')
    end
    it 'should redirect to movies if empty key words' do
      post :search_tmdb, {:search_terms => ' '}
      expect(response).to redirect_to('/movies')
    end
    it 'should redirect to movies if no key words' do
      post :search_tmdb, {:search_terms => ''}
      expect(response).to redirect_to('/movies')
    end
  end
  
  describe 'Create movie from TMDb' do
     it 'should call the model method that performs create_from_tmdb' do
        Movie.should_receive(:create_from_tmdb).with('406234')
        post :add_tmdb, {"utf8"=>"✓", "tmdb_movies"=>{"406234"=>"1"}, "commit"=>"Add Selected Movies", "id"=>"search_tmdb"}
        # "checkbox"=>{"406234"=>"1"}, "commit"=>"Add Selected Movies", "id"=>"search_tmdb"
        expect(flash[:notice]).to be_present
     end
     it 'should notify No movies selected and redirect to movies' do
        post :add_tmdb, {"utf8"=>"✓", "tmdb_movies"=> nil, "commit"=>"Add Selected Movies", "id"=>"search_tmdb"}
        expect(flash[:notice]).to eq "No movies selected"
        expect(response).to redirect_to('/movies')
     end
    end
  
  
end
