require 'watir'

browser= Watir::Browser.new :chrome

browser.goto "http://wap.rmtcgoiania.com.br/"

browser.text_field(:name=>"txtStopName").set "3658"

browser.button(:name => "btnAsk").click

browser.tables.each do |table|

  table.rows.each do |row|

    if row.cells[0].text == "305" 

      if row.cells[-1].text <= "50"

        puts "Previsto para os proximos 50min"

      else

        puts "Nao ha previsao para os proximos 50min"

      end

    end

  end

end

browser.close