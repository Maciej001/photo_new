FactoryGirl.define do 
	factory :user do 
		name				"Maciej Nowakowski"
		email 			"maciej@gmail.com"
		password 		"foobar"
		password_confirmation "foobar"
	end
end