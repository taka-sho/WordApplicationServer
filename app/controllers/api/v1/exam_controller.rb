class Api::V1::ExamController < ApplicationController
  def learned #覚えるパート
    # word = Word.all.sample
    # @data = {
    #   question: word.,
    #   answer: ,
    #   dummy: []
    # }
    render json: @data
  end

  def challenge #チャレンジパート
    render json: hoge(current_user.words.sample)
  end

  def traning トレーニング
    render json: hoge(Word.all.sample)
  end

  private

  def hoge(choice_word)
    if choice_word
      if params[:data_format] == "japanese"
        @data = {
          question: choice_word.japanese,
          answer: choice_word.english,
          dummies: choice_word.word_dummies.map(&:english).sample(3)
        }
      elsif params[:data_format] == "english"
        @data = {
          question: choice_word.english,
          answer: choice_word.japanese,
          dummies: choice_word.word_dummies.map(&:english).sample(3)
        }
      else
        @data = {error: "形式不明"}
      end
    else
      @data = {error: "学習単語なし"}
    end
    return @data
  end

  def remembered
  end

end
