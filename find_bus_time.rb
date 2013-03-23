load 'find_bus_time.rb'

@bus_stop_number = "3658"
@bus_line_number = "305"
@how_many_minutes = "50"

browser = inicialize(browser)

search(browser,@bus_stop_number)

find_bus_time(browser,@bus_line_number,@how_many_minutes)

close_browser(browser)