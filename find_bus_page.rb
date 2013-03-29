require 'watir'

class FindBusPage
  attr_accessor :list

  def initialize
    @list = [] 
    @browser = Watir::Browser.new :chrome
    @browser.goto("http://wap.rmtcgoiania.com.br")
  end

  def search(number)
    @browser.text_field(:name=> 'txtStopName').set number
    @browser.button(:name => 'btnAsk').click
  end

  def find_bus_time(line_number)
    rows = @browser.tables.first.rows

    rows.each do |row|
      if row.cells.first.text == line_number 
        next_bus_time = row.cells.last.text.to_i
        @list << next_bus_time
      end
    end

    @list
  end

  def there_is_bus_within?(minutes)
    raise "Error" if @list.empty?
    @list.any? do |time|
      time <= minutes
    end
  end

  def close_browser
    @browser.close
  end
end