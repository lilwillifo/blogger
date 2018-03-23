require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays information for one article' do
      article = Article.create!(title: 'New Title', body: 'New Body')
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")

      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
  describe "they fill in a comment form" do
    it "displays the comment on the article show" do
      article = Article.create!(title: "A Title", body: "A Body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "Margaret"
      fill_in "comment[body]", with: "SoOoO many thoughts on this article."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("Comments (#{article.comments.count})")
      expect(page).to have_content("Margaret")
      expect(page).to have_content("SoOoO many thoughts on this article.")
    end
  end
end
