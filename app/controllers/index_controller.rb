get '/' do
  erb :index
end

get '/anagrams/:word' do
	@word = params[:word]
	alphabetized_string = @word.chars.sort.join
    @anagrams = Word.where("letters=?", alphabetized_string)
	erb :show
end

get '/words' do
  	@words = Word.all
    erb :"/words/index"
end

get '/words/:id' do
  	@word = Word.find(params[:id])
  	@word = @word.text
  	@letters = @word.chars
    erb :"/words/show"
end

post '/' do
	@word = params[:word]
	begin
		Word.valid_input(@word)
		redirect "/anagrams/#{@word}"
	rescue Exception => error
		@error = error.message
		erb :index
	end
end
