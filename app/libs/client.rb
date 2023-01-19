require "thor"

class Client < Thor
  option :host, aliases: "-h", default: ENV["REDIS_HOST"].nil? ? "redis" : ENV["REDIS_HOST"], desc: "Redis host"
  option :port, aliases: "-p", default: ENV["REDIS_PORT"].nil? ? 6379 : ENV["REDIS_PORT"], desc: "Redis port"

  def initialize(*args)
    super
    @redis = ClientDAO.new(options[:host], options[:port])
  end

  desc "set KEY VALUE", "set the value of a key"
  def set(key, value)
    @redis.set(key, value)
    puts "'OK'"
  end

  desc "get KEY", "get the value of a key"
  def get(key)
    value = @redis.get(key)
    value != nil ? (puts "#{key} => #{value}") : (puts "'Key not found...'")
  end

  desc "unset KEY", "unset the value of a key"
  def unset(key)
    @redis.get(key) != nil ? (@redis.unset(key); puts "'OK'") : (puts "'Key not found...'")
  end

  desc "incr KEY", "increment the value of a key"
  def incr(key)
    @redis.get(key) != nil ? (@redis.incr(key); puts "'OK'") : (puts "'Key not found...'")
  end

  desc "numequalto VALUE", "get the number of keys with a given value"
  def numequalto(value)
    puts @redis.numequalto(value)
  end

  desc "keys", "get all keys"
  def keys
    @redis.keys.empty? ? (puts "'No keys found...'") : (@redis.keys.each { |key| puts key })
  end
end