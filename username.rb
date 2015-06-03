def generate_username1 (first_name)
  #nondestructive lowercases everything in string
  first_name[0].downcase
end


def generate_username2 (first_name, last_name)
  unless first_name == '' || last_name == ''
    firstLetter = first_name.gsub(/[^a-zA-Z]/, '')[0].downcase
    lastName = last_name.gsub(/[^a-zA-Z]/, '').downcase
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


$users = []

def generate_username5 (first_name, last_name, birth_year, level=0)
  username = generate_username4(first_name, last_name, birth_year, level)

  counter = 0
  isNotUnique = is_username_not_unique?(username)

  if !isNotUnique
    $users.push(username)
    username
  else
    holdUsername = username
    while is_username_not_unique?(username)
      username = holdUsername
      counter += 1
      username += "_" + counter.to_s
    end
    $users.push(username)
    username
  end
end


def is_username_not_unique? (username)
  $users.include? username
end


# first_name = ARGV[0]
# last_name = ARGV[1]
# birth_year = ARGV[2]
# level = ARGV[4]


print 'First Name > '
$first_name = gets.chomp #why can't i use first_name
print 'Last Name > '
$last_name = gets.chomp
print 'Birth Year > '
$birth_year = gets.chomp
print 'Level? (0-3) > '
$level = gets.chomp


generate_username5($first_name, $last_name, $birth_year.to_i, $level.to_i)