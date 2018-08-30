ActiveAdmin.register User do
  permit_params :email, :name, :bio, :role, :avatar
end
