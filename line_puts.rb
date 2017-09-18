require 'pp'

def line_puts(arr, data_len)
	i = 0
	tmp = Hash.new
	rem = (arr.size.to_f/data_len.to_f).ceil

	for i in 0..rem
		l = i * data_len
		tmp.store(i, arr[l..l+data_len-1]) if i != rem
		tmp.store(i, arr[l..arr.size-1])   if i == rem
	end
	#tmp.compact!
	return tmp

end

def max_line(arr, data_len)
	result = [nil,nil,nil]
	max_val = arr.max
	line_puts(arr,data_len).each do |key, val|
		next if !val.is_a?(Array)
		result = [key, val.max, val.index(val.max)] if val.max.eql?(max_val)
	end
	return result
end

data = (0..31).to_a

pp line_puts data, 6
pp max_line data, 6