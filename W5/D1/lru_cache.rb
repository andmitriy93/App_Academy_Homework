class LRUCache
    def initialize(length)
        @cache_length = length
        @lru = []
    end

    def count
      # returns number of elements currently in cache
      @lru.count
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @lru.include?(el)
            @lru.delete(el)
            @lru << el
        elsif count >= @cache_length
            @lru.shift
            @lru << el
        else
            @lru << el
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @lru
    end

    private
    # helper methods go here!

  end

  
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.show