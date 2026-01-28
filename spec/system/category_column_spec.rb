# frozen_string_literal: true

RSpec.describe "Category column" do
  fab!(:theme) { upload_theme_component }
  fab!(:category)
  fab!(:topics) { Fabricate.times(3, :topic, category: category) }

  it "renders the category column" do
    visit "/latest"

    expect(page).to have_css("th.topic-list-data.category", count: 1)
    expect(page).to have_css("td.topic-list-data.category", text: category.name, count: 3)
  end
end
