get '/words' do
	word = params[:word]
  	@words = Word.all
    erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end

post '/words' do
    word = Word.create(text: params[:word])
    redirect "/words/#{word.id}"
end

get '/words/:id' do
  	word = Word.find(params[:id])
  	@word = word.text
  	@letters = @word.chars
    erb :"/words/show"
end