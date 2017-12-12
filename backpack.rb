class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # set up local variables used by rest of prepare method
    preparation


    # Ensure appropriate clothing is added to backpack
    weather_packing

    # Ensure gym shoes are added to backpack if it's a gym day(ie Monday and Thursday)
    day_packing

  end

  def preparation
    @weather = @attributes[:weather]
    @day_of_week = @attributes[:day_of_week]
  end


  def weather_packing
    rainy
    cold
    other
  end

  def rainy
    if @weather == 'rainy'
      @items << 'pants'
      @items << 'shirt'
      @items << 'umbrella'
    end
  end

  def cold
    if @weather == 'cold'
      @items << 'pants'
      @items << 'shirt'
      @items << 'jacket'
    end
  end

  def other
    if @weather != 'cold' && @weather != 'rainy'
      @items << 'pants'
      @items << 'shirt'
    end
  end


  def day_packing
    shoes
    food
  end

  def shoes
    if @day_of_week == 'monday' || @day_of_week == 'thursday'
      #add gym shoes to items
      @items << 'gym shoes'
    end
  end

  def food
    # Bring a packed lunch on all weekdays, now buys snacks.
    if @day_of_week != 'saturday' && @day_of_week != 'sunday'
      @items << 'packed lunch'
    end
  end

  # Prints a summary packing list for Melinda's backpack
  def packing_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
