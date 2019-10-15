module ProductsHelper

    def to_currency(price)
        number_to_currency(price, :unit => "$", :separator => ",", :delimiter => ".")
    end
end
