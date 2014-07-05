describe "check images and favicon" do
  before { visit "adventure/image")

  it "should have the images" do
    expect(page).to have_css('img')
  end
end