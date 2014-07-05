require 'rails_helper'
  describe CategoryAdventure do 
    it "should link the category and adventure tables" 
      expect(category.adventure).to exist
	end		 		
end
