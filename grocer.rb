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

    if cart[item] && coupon_hash[:item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
      cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[], clearance: , count: }
      
    end  
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
