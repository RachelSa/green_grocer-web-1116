def consolidate_cart(cart)
  result = {}
  counting = {}
  final = {}
  i = 0
  	cart.each do |el|
  		el.each do |item, details|
  			if result[item] == nil
  				result[item] = details
  				counting[item] = {count: 1}
  			else counting[item][:count] = counting[item][:count] += 1
  			end

  	end
  end

result.each do |item, details|
	result[item].merge!(counting[item])

end
result

end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
