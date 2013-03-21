require 'watir'

@url = "http://wap.rmtcgoiania.com.br/"
@text_field_name = "txtStopName"
@text_field_value = "3658"
@button_name = "btnAsk"
@bus_line_number = "305"
@how_many_minutes = "50"
@success_message = "Previsto para os proximos 50min"
@fail_message = "Nao ha previsao para os proximos 50min"

browser= Watir::Browser.new :chrome

browser.goto(@url)
browser.text_field(:name=> @text_field_name).set(@text_field_value)
browser.button(:name => @button_name).click

browser.tables.each do |table|
  table.rows.each do |row|
    if row.cells[0].text == @bus_line_number 
      if row.cells[-1].text <= @how_many_minutes      	
        puts @success_message
      else
        puts @fail_message
      end
    end
  end
end

browser.close