get '/words' do
	word = params[:word]
	@words = Word.all.sort
	erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end

post '/words' do
	@word = Word.create(text: params[:word])
	@letters = @word.text.chars
	if @letters.count > 0
		@word.save	
		redirect "/words/#{@word.id}"
	else
		@word.delete
		@error = "nah man. you gotta put in more letters."
		erb :"/words/new"
	end

end

get '/words/:id' do
	@word = Word.find(params[:id])
	@letters = @word.text.chars
	erb :"/words/show"
end

get '/words/:id/edit' do
    @word = Word.find(params[:id])
    erb :"/words/edit"
end

put '/words/:id' do
	@word = Word.find(params[:id])
	@word.text = params[:word]
	@letters = @word.text.chars
	@word.save
	erb :"/words/show"
end

delete '/words/:id' do
 	word = Word.find(params[:id])
 	word.delete
    redirect "/words"
end