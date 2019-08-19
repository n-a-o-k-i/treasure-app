ActiveAdmin.register Member do
	permit_params :name, :age, :gender, :birth, :joined_date, :grade, :department, :address, :tel
end
