class Admin < Person
  devise :database_authenticatable, :timeoutable
end
