require 'rails_helper'

describe "user edits an article" do
  describe "they link from the show page" do
    context "they fill in an edit field" do
      it "dispays the updated information on show" do
        article = Article.create!(title: "name", body: "text")

        visit article_path(article)
        click_link "edit"
        fill_in "article[title]", with: "nAmE"
        fill_in "article[body]", with: "text"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content("nAmE")
        expect(page).to have_content("text")
        expect(page).to have_content('Article nAmE updated!')
      end
    end
  end
end
