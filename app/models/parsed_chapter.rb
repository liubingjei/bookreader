class ParsedChapter < ApplicationRecord
  belongs_to :book, counter_cache: true

  before_create :set_words_count

  def set_words_count
    self.words_count = content.length
  end

  def translate?
    is_translated
  end

  def translate!
    ContentTranslater.new(self).translate!
  end
end

# == Schema Information
#
# Table name: parsed_chapters
#
#  id                     :integer          not null, primary key
#  content                :text
#  book_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  words_count            :integer          default(0)
#  translated_content     :text
#  is_translated          :boolean          default(FALSE)
#  translated_words_count :integer          default(0)
#
