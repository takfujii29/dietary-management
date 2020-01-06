# json.array! @menus, partial: "menus/menu", as: :menu
json.array!(@menus) do |menu|
  json.title event.title
  json.url menu_url(menu, format: :html) 
end