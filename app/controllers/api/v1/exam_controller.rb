class Api::V1::ExamController < ApplicationController
  def learned #覚えるパート
    @data = { englishes: Word.all.sample(5).map(&:english) }
    render json: @data
  end

  def challenge #チャレンジパート
    render json: hoge(current_user.words.sample)
  end

  def training #トレーニング
    render json: hoge(Word.all.sample)
  end

  def remembered
    data = WordThatTheUserLearned.new(
      user_id: params["user_id"].to_i,
      word_id: params["word_id"].to_i
    )
    p data
    render json: (data.save ? {status: 201} : {status: 500})
  end

  private

  def hoge(choice_word)
    if choice_word
      dummies = [{ japanese: choice_word.japanese, english: choice_word.english }]
      choice_word.dummy_of_from_word.each { |word| 
        dummies << { japanese: word.japanese, english: word.english }
      }
      @data = {
        id: choice_word.id,
        japanese: choice_word.japanese,
        english: choice_word.english,
        dummies: dummies.shuffle
      }
    else
      @data = {error: "学習単語なし"}
    end
    return @data
  end
end
