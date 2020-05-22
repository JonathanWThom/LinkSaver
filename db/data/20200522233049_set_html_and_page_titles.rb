class SetHtmlAndPageTitles < ActiveRecord::Migration[5.2]
  def up
    Link.all.each do |link|
      link.html = link.html_preview
      link.page_title = link.title
      link.save!
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
