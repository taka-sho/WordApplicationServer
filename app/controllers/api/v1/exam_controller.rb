class Api::V1::ExamController < ApplicationController
  def index #ランダムにQuestionを作る
    # Word.where()
    # @data = {
    #   question: ,
    #   answer: ,
    #   dummy: []
    # }
    render json: @data
  end

  def learned
    choice_word = current_user.words.sample
    if choice_word
      if params[:data_format] == "japanese"
        @data = {
          question: choice_word.japanaze,
          answer: choice_word.english,
          dummies: choice_word.english_word_for_dummies.map(&:dummy_word).sample(3)
        }
      elsif params[:data_format] == "english"
        @data = {
          question: choice_word.english,
          answer: choice_word.japanaze,
          dummies: choice_word.japanese_word_for_dummies.map(&:dummy_word).sample(3)
        }
      else
        @data = {error: "形式不明"}
      end
    else
      @data = {error: "学習単語なし"}
    end
    render json: @data
  end

  def remembered
  end

end
