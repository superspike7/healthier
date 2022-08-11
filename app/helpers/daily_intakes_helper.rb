module DailyIntakesHelper
  TOO_MUCH = 'Too Much'.freeze
  PERFECT = 'Perfect Amount'.freeze
  NEEDS_MORE = 'You Need More'.freeze

  def nutrient_background_color(description)
    case description
    when TOO_MUCH
      'bg-red-200'
    when PERFECT
      'bg-green-200'
    else
      'bg-purple-100'
    end
  end
end
