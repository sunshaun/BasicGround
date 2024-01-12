# practice 7: hash key => value
# nil is and only is a falsy in Ruby (other is all truthy)
#
# Hash.new(0): create a new hash with a default value of 0 for any unassigned key
# using hash[unassigned_key] += 1, Can:
# when encountering the same key again, the value of 0 will be incremented by 1

def create(options = {})
  puts "Createing #{options[:db]} for owner #{options[:user]}..."
end

def connect(db:, host: "localhost", port: 3306, user: "root")
  puts "Connecting to db on #{host}, port is #{port} as #{user}..."
end

# unpack the hash as parameters, and pass them to method
create(db: "Main", user: "Admin")
create(user: "guest")
create

# keywords perameters and default parameters
connect(db: "Demo")


# connect(db: "Demo", password: 1100)
# connect(user: "ghost")
#
# OUTPUT: in `connect': unknown keyword: :password
#         in `connect': missing keyword: :db 
