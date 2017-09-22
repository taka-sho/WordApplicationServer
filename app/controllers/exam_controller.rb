class ExamController < ApplicationController
  def training
    render "exam/traning"
  end
  def challenge
    render "exam/challenge"
  end
  def learn
    render "exam/learn"
  end
end
