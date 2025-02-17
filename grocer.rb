def consolidate_cart(cart)
  new_cart ={}
  count = 0 
  
  cart.each do |element|
    element.each do |item, hash|
      new_cart[item] ||= hash
      new_cart[item][:count] ||= 0
      new_cart[item][:count] += 1
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    
    item = coupon[:item]

    if cart[item]
      if cart[item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num ], clearance: cart[item][:clearance], count: coupon[:num]}
          cart[item][:count] -= coupon[:num]
    elsif
      cart[item][:count] >= coupon[:num] && cart["#{item} W/COUPON"]
      cart["#{item} W/COUPON"][:count] += coupon[:num]
      cart[item][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |product_name, stats|
    stats[:price] -= stats[:price] * 0.2 if stats[:clearance]
    
  end
  cart
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(new_cart, coupons)
  clearance_cart = apply_clearance(coupon_cart)
  
  total = clearance_cart.reduce(0){|acc, (key, value)| acc += value[:price] * value[:count]}
  
  total > 100? total * 0.9 : total
end
