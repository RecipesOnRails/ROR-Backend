class ResultSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :title, :image, :cuisine, :calories, :id
end
