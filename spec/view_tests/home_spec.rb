# spec/views/products/_product.html.erb_spec.rb

describe 'index.erb' do
  context 'when the adventure has a url' do
    it 'displays the url' do
      assign(:adventure, build(:category, url: 'http://dustbowl.com')

      # render

      expect(rendered).to have_link 'category', href: 'http://dustbowl.com'
    end
  end

  context 'when the product url is nil' do
    it "displays 'none'" do
      assign(:adventure, build(:category, url: nil)

      # render

      expect(rendered).to have_content 'None'
    end
  end
end