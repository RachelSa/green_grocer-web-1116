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
  if coupons.length == 0
	return cart
end
  	result = {}
  	adjusted = {}
  coupons.each do |c|
  	cart.each do |food, detail|
  			if food == c[:item]
  				num_coups= cart[food][:count] / c[:num]
  				coups = c[:cost] * (num_coups)
  				clear = cart[food][:clearance]
  				adjusted["#{food} W/COUPON"] = {price: coups, clearance: clear, count: num_coups}
  				remaining = cart[food][:count] % c[:num]
  				result[food] = detail
  				result[food][:count] = remaining
  			else result[food] = detail
  			end
  		end
  	end
  	result.merge!(adjusted)
  	cart = result
  	cart
  end


  def apply_clearance(cart)
    cart.each do |item, details|
  	if cart[item][:clearance] == true
  		cart[item][:price] = (0.8 * cart[item][:price]).round(2)
  	end
  	end
    cart
  end


  def checkout(cart, coupons)
  	total = 0
  	consolidated = consolidate_cart(cart)
    	couponed = apply_coupons(consolidated, coupons)
    	cleared = apply_clearance(couponed)
    	cleared.each do |food, details|
    		total += cleared[food][:price] * cleared[food][:count]
    	end
      if total > 100
      		total = (total * 0.9).round(2)
      	else total
      	end

  end
