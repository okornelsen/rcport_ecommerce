ActiveAdmin.register Province do
  permit_params :name, :abbrev, :gst, :pst, :hst
end
