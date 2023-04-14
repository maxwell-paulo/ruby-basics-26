def louchebemize(sentence)
  # TODO: implement your louchebem translator
  array = sentence.split
  suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  new_arr = []
  consonant_group = ""
  new_word = ""



  array.each do |c|
    # Check if the word has only one letter
    if c.length == 1
      new_arr << c
    end

    # If the word starts with consonant do this
    if !c.downcase.start_with?(/^[aeiou]/) && c.length > 1
      i = 0
      while i < c.length do
        if ["a", "e", "i", "o", "u"].include?(c[i].downcase)
          new_word << c.gsub(consonant_group, "l") << consonant_group << suffix.sample
          new_arr << new_word
          new_word = ""
          consonant_group = ""
          break
        else
          consonant_group << c[i]
          i += 1
        end
      end

    end

    # If the word stars with vowel do this
    if c.downcase.start_with?(/^[aeiou]/) && c.length > 1
      c.prepend("l")
      c << suffix.sample
      new_arr << c
    end
  end

  # If the word has any special character do this
  new_arr.each_with_index do |c, index|
    i = 0
    while i < c.length
      if c[i] =~ /[^[:alnum:][:space:]áéíóúãõâêîôûàèìòùäëïöü]/
        character = c.slice!(c[i])
        c += character

      end
      i += 1
  end
  new_arr[index] = c
end

new_arr.join(" ")

end
