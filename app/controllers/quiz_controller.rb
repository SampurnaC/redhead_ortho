class QuizController < ApplicationController

  # ==========================================
  # START
  # ==========================================

  def start
    session[:quiz] ||= {}
  end


  def save_details

    session[:quiz] = {
      "first_name" => params[:first_name],
      "last_name" => params[:last_name],
      "email" => params[:email],
      "contact_permission" => params[:contact_permission]
    }

    redirect_to "/quiz/1"

  end


  # ==========================================
  # QUESTION 1
  # ==========================================

  def question1
    session[:quiz] ||= {}
  end


  def save_question1

    session[:quiz]["teeth_stick_out"] =
      params[:teeth_stick_out]

    redirect_to "/quiz/2"

  end


  # ==========================================
  # QUESTION 2
  # ==========================================

  def question2
    session[:quiz] ||= {}
  end


  def save_question2

    session[:quiz]["crowding"] =
      params[:crowding]

    redirect_to "/quiz/3"

  end


  # ==========================================
  # QUESTION 3
  # ==========================================

  def question3
    session[:quiz] ||= {}
  end


  def save_question3

    session[:quiz]["narrow_smile"] =
      params[:narrow_smile]

    redirect_to "/quiz/4"

  end


  # ==========================================
  # QUESTION 4
  # ==========================================

  def question4
    session[:quiz] ||= {}
  end


  def save_question4

    session[:quiz]["bite"] =
      params[:bite]

    redirect_to "/quiz/5"

  end


  # ==========================================
  # QUESTION 5
  # ==========================================

  def question5
    session[:quiz] ||= {}
  end


  def save_question5

    session[:quiz]["priority"] =
      params[:priority]

    redirect_to "/quiz/6"

  end


  # ==========================================
  # QUESTION 6
  # ==========================================

  def question6
    session[:quiz] ||= {}
  end


  def save_question6

    session[:quiz]["wear_22_hours"] =
      params[:wear_22_hours]

    session[:quiz]["tea_coffee"] =
      params[:tea_coffee]

    session[:quiz]["snacking"] =
      params[:snacking]

    redirect_to "/quiz/complete"

  end


  # ==========================================
  # COMPLETE
  # ==========================================

  def complete
    session[:quiz] ||= {}
  end


  # ==========================================
  # CALCULATE RESULT
  # ==========================================

  def results

    score = calculate_score

    result = calculate_result(score)


    submission = QuizSubmission.create!(
      first_name: session[:quiz]["first_name"],
      surname: session[:quiz]["surname"],
      email: session[:quiz]["email"],
      score: score,
      result: result,
      answers: session[:quiz]
    )


    session.delete(:quiz)


    redirect_to "/quiz/result/#{submission.id}"

  end


  # ==========================================
  # SHOW RESULT
  # ==========================================

  def result

    @submission =
      QuizSubmission.find(params[:id])

  end


  private


  # ==========================================
  # GOOGLE FORM SCORING
  # ==========================================

  def calculate_score

    score = 0


    # ------------------------------------------
    # Teeth stick out
    # Yes = 10
    # No = 0
    # ------------------------------------------

    if session[:quiz]["teeth_stick_out"] == "yes"
      score += 10
    end


    # ------------------------------------------
    # Crowding
    #
    # Mild = 0
    # Moderate = 10
    # Severe = 15
    # Not crowded = 0
    # ------------------------------------------

    case session[:quiz]["crowding"]

    when "mild"
      score += 0

    when "moderate"
      score += 10

    when "severe"
      score += 15

    when "none"
      score += 0

    end


    # ------------------------------------------
    # Narrow smile
    #
    # Yes = 50
    # No = 0
    # ------------------------------------------

    if session[:quiz]["narrow_smile"] == "yes"
      score += 50
    end


    # ------------------------------------------
    # Bite
    #
    # Reverse = 25
    # Open = 25
    # Neither = 0
    # ------------------------------------------

    case session[:quiz]["bite"]

    when "reverse"
      score += 25

    when "open"
      score += 25

    when "neither"
      score += 0

    end


    # ------------------------------------------
    # What matters most?
    #
    # Comfort = 10
    # Speed = 50
    # Invisible = 50
    # ------------------------------------------

    case session[:quiz]["priority"]

    when "comfort"
      score += 10

    when "speed"
      score += 50

    when "invisible"
      score += 50

    end


    # ------------------------------------------
    # Wear removable brace 22 hours
    #
    # Yes = 0
    # No = 25
    # ------------------------------------------

    if session[:quiz]["wear_22_hours"] == "no"
      score += 25
    end


    # ------------------------------------------
    # Tea / Coffee
    #
    # Yes = 5
    # No = 0
    # ------------------------------------------

    if session[:quiz]["tea_coffee"] == "yes"
      score += 5
    end


    # ------------------------------------------
    # Snacking
    #
    # Lots of snacks = 25
    # Main meals = 0
    # ------------------------------------------

    if session[:quiz]["snacking"] == "snacks"
      score += 25
    end


    score

  end


  # ==========================================
  # RESULT
  # ==========================================

  def calculate_result(score)

    if score <= 50

      "Removable Invisalign brace"

    elsif score <= 100

      "Hidden lingual brace"

    else

      "Outside fixed brace"

    end

  end

end
