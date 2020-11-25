ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :username, :address, :province_id
end
