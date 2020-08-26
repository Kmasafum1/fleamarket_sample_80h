crumb :root do
  link "トップページ  ", root_path
end

crumb :mypage do
  link "マイページ  ", users_path
end

crumb :card_show do
  @card = Card.find_by(user_id: current_user.id)
  link "クレジットカード詳細ページ  ", card_path(@card.id)
  parent :mypage
end

crumb :card_new do
  link "クレジットカード作成ページ  ", new_card_path
  parent :mypage
end

crumb :item_new do
  link "商品出品ページ  ", new_item_path
  parent :mypage
end

crumb :item_show do
  @item = Item.find(params[:id])
  link "商品詳細ページ  ", item_path(@item.id)
end

crumb :item_edit do
  @item = Item.find(params[:id])
  link "商品編集ページ  ", edit_item_path(@item.id)
  parent :item_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).