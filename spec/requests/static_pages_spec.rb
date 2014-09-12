require 'spec_helper'

describe "StaticPages" do

	subject {page}
  
	describe "Home page" do

		before {visit root_path}

		it {should have_selector('h2', text: 'Sign up')}
		it {should have_selector('h2', text: 'Sign in')}

	end

end
