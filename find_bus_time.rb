  load 'find_bus_page.rb'
  require 'rspec'

  describe FindBusPage do
    before :each do
      @page = FindBusPage.new
      @page.search '3658'
    end

    after :each do
      @page.close_browser
    end

  	it 'ensures that the next bus time is within 50min' do 
      @page.find_bus_time '305' 
      bus_within_50_min = @page.there_is_bus_within? 50

    	bus_within_50_min.should == true
    end

    it "throws an exception when no bus line was searched" do
      expect { @page.there_is_bus_within? 50 }.to raise_error
    end
  end
