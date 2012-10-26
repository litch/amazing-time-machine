require_relative './jltime'

describe "JLTime" do
      
  it "should raise an error if the hours are greater than 12 or the minutes are greater than 59" do
    expect { t = JLTime.add_minutes_to_time("13:23 AM", 10) }.to raise_error
    expect { t = JLTime.add_minutes_to_time("11:99 AM", 10) }.to raise_error
  end
  
  it "should output as a string properly" do
    t = JLTime.add_minutes_to_time("12:15 AM", 0)
    t.should eq "12:15 AM"
    t = JLTime.add_minutes_to_time("09:13 AM", 0)
    t.should eq "9:13 AM"
  end
  
  it "should be able to increment minutes (vanilla)" do
    t = JLTime.add_minutes_to_time("9:13 AM", 10)
    t.should eq "9:23 AM"
  end

  it "should be able to increment hours" do
    t = JLTime.add_minutes_to_time("9:13 AM", 60)
    t.should eq "10:13 AM"
  end
  
  it "should be able to increment days" do
    t = JLTime.add_minutes_to_time("11:34 PM", 50)
    t.should eq "12:24 AM"
  end
  
  it "should be able to increment huge values" do
    # >> t = Time.now
    # => 2012-10-25 18:37:04 -0500
    # >> t2 = t + 100000*60
    # => 2013-01-03 04:17:04 -0600
    t = JLTime.add_minutes_to_time("6:37 PM", 100000)
    t.should eq "5:17 AM"
  end

end
