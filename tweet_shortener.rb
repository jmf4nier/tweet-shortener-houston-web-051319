def dictionary
  hash = {
        "Hello" => "hi",
        "to" => '2',
        "two" => '2',
        "too" => '2',
        "for" => '4',
        "four" => '4',
        "be" => 'b',
        "you" => 'u',
        "at" => "@",
        "and" => "&"}
end

def word_substituter (tweet)
  array = tweet.split(" ")
  array.each_with_index do |string, index|
    dictionary.keys.each do |x|
      if x == string
         array[index] = dictionary[x]
      end
    end    
  end
array.join(" ")  
end

def bulk_tweet_shortener(array)
  array.each do |tweet|                               #iterates through the array of mulitple tweets
    new_array = tweet.split(" ")                      #splits each tweet in its own array with space between objects
    new_array.each_with_index do |word, index|        #iterates through the newly-formed tweet arrays while also indexing each
      dictionary.keys.each do |x|                     #calls and iterates dictionary(hash)using .keys method with 'x' being the keys
        if x == word.downcase                         #compares the key 'x' of current iteration to the 'word' in the tweet array. downcase to standardize for comparison
          new_array[index] = dictionary[x]            #assigns value of word at current index in tweet array to the value called by the dictionary
        end
      end
    end
  puts new_array.join(" ")                      #outputs the iterated singular tweet arrays and turns into strings.
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    array = tweet.split(" ")
    array.each_with_index do |string, index|
      dictionary.keys.each do |x|
        if x == string
         array[index] = dictionary[x]
        end
      end    
    end
  array.join(" ")  
  else 
    tweet  
  end
end

def shortened_tweet_truncator(tweet)
   new_tweet = word_substituter(tweet)
    if new_tweet.length > 140
       new_tweet[1..137] + "..."
    else 
     word_substituter(tweet)
  end
end  