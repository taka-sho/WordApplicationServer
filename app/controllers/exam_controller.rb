class ExamController < ApplicationController
  def traning
    render "exam/traning"
  end
  def challenge
    render "exam/challenge"
  end
  def learn
    render "exam/learn"
  end
end
