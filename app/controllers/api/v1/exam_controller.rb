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
    render json: (data.save ? {status: 201} : {status: 500})
    # render status: :201
  end

  private

  def hoge(choice_word)
    if choice_word
      if params[:data_format] == "japanese"
        @data = {
          question: choice_word.japanese,
          answer: choice_word.english,
          dummies: choice_word.dummy_of_from_word.map(&:english).sample(3)
        }
      elsif params[:data_format] == "english"
        @data = {
          question: choice_word.english,
          answer: choice_word.japanese,
          dummies: choice_word.dummy_of_from_word.map(&:japanese).sample(3)
        }
      else
        @data = {status: "400"} #Other than English or Japanese
      end
    else
      @data = {error: "学習単語なし"}
    end
    return @data
  end
end
