require "redis"

class ClientDAO
  def initialize(host, port)
    @redis = Redis.new(host: host, port: port)
  end

  def get(key)
    @redis.get(key)
  end

  def set(key, value)
    @redis.set(key, value)
  end

  def unset(key)
    @redis.del(key)
  end

  def incr(key)
    @redis.incr(key)
  end

  def numequalto(value)
    @redis.keys("*").select { |k| @redis.get(k) == value }.size
  end

  def keys
    @redis.keys
  end
end