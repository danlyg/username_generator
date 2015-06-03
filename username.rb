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
  fLast = generate_username2(first_name, last_name)

  yearLength = Math.log10(birth_year).to_i + 1
  if yearLength == 4
    fLast + birth_year.to_s[-2..-1]
  end
end


def check_privilege (level=0)
  privilege = "user" if level == 0
  privilege = "seller" if level == 1
  privilege = "manager" if level == 2
  privilege = "admin" if level == 3
  
  privilege
end

def generate_username4 (first_name, last_name, birth_year, level=0)
  username = generate_username3(first_name, last_name, birth_year)

  privilege = check_privilege(level)

  if level != 0 
    privilege + "-" + username
  else
    username
  end

end
