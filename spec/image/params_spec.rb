require_relative '../../image/params'

include Image 

describe Params do
  it "takes a bunch of options" do
    font = double
    features = ['kern', 'aalt', 'onum', 'liga']

    params = Params.new(
      font: font,
      color: 'black',
      features: features, 
      text: 'Lorem ipsum',
      size: 26
    )

    params.font.should eq font 
    params.color.should eq 'black'
    params.features.should eq features
    params.text.should eq 'Lorem ipsum'
    params.size.should eq 26
  end
end
