def sluggish_octopus(arr)
    longest = ""
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            if arr[i].length > arr[j].length && arr[i].length > longest.length
                longest = arr[i]
            else
                longest = arr[j]
            end
        end
    end
    longest
end

def dominant_octopus(arr)
    prc = Proc.new {|a, b| a <=> b}
    return arr if arr.length <= 1

    pivot = [arr.first]
    left = arr[1..-1].select {|ele| prc.call(ele, arr.first) == -1}
    right = arr[1..-1].select {|ele| prc.call(ele, arr.first) != 0}
    dominant_octopus(right)
end

def clever_octopus(arr)
    longest = arr[0]
    arr.each  { |ele| longest = ele if ele.length > longest.length }
    longest
end

def dancing_octopus(tentacle, tiles_array)
    tiles_array.each_with_index do |ele, i|
        if ele == tentacle
            return i
        end
    end
    false
end


def slow_dance(tentacle, tiles_array)
    tiles_array.each_with_index do |ele, i|
        if ele == tentacle
            return i
        end
    end
    false
end

def constant_dance!(arg, new_tiles_data_structure)
    return new_tiles_data_structure.index(arg)
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

# puts sluggish_octopus(arr)
# puts dominant_octopus(arr)
# # puts clever_octopus(arr)
# # p dancing_octopus("right-up", tiles_array)
# p slow_dance("right-up", tiles_array)
# p constant_dance!("right-up", tiles_array)