require_relative 'reverse_letters'

def find_anagram(word)
	letters = word.split("")
	length = letters.count
	new_words = letters.permutation(length).map(&:join)
	return new_words
end