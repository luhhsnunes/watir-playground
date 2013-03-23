require 'watir'

@url = "http://wap.rmtcgoiania.com.br/"
@text_field_name = "txtStopName"
@button_name = "btnAsk"
@success_message = "Previsto para os proximos 50min"
@fail_message = "Nao ha previsao para os proximos 50min"

def inicialize(browser)
 
 browser= Watir::Browser.new :chrome
 browser.goto(@url)
 
 return browser

end

def search(browser,bus_stop_number)
 
 browser.text_field(:name=> @text_field_name).set @bus_stop_number
 browser.button(:name => @button_name).click

end

def find_bus_time(browser,line_number,minutes)

 browser.tables.each do |table|
  table.rows.each do |row|
    if row.cells[0].text == line_number 

      if row.cells[-1].text <= minutes      	
        puts @success_message
      else
        puts @fail_message
      end

    end
  end
 end
end

def close_browser(browser)

 browser.close

end