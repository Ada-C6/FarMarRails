module PathCheck
  def product_sale?
    if params[:product_id] != nil
      return true
    end
  end

  def vendor_sale?
    if params[:vendor_id] != nil
      return true
    end
  end

  def market_sale?
    if params[:market_id] != nil
      return true
    end
  end
end
