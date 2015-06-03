def generate_username1 (first)
  #nondestructive lowercases everything in string
  first[0].downcase
end

def generate_username2 (first, last)
  unless first == '' || last == ''
    firstLetter = first.gsub(/[^a-zA-Z]/, '')[0].downcase
    lastName = last.gsub(/[^a-zA-Z]/, '').downcase
    firstLetter + lastName
  end
end

def generate_username3 (first_name, last_name, birth_year)
  generate_username2(first_name, last_name)


end