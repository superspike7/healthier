module Intake
  class NutrientsDescriptor < ApplicationService
    TOO_MUCH = 'Too Much'.freeze
    PERFECT = 'Perfect Amount'.freeze
    NEEDS_MORE = 'You Need More'.freeze

    def initialize(daily_intake)
      @daily_intake = daily_intake
    end

    def call
      describe_nutrients
    end

    private

    def describe_nutrients
      Struct.new(:calories, :carbohydrates, :fats, :protein).new(calories, carbohydrates, fats, protein)
    end

    def calories
      case @daily_intake.total_calories
      when 1500..2400
        PERFECT
      when 0..1499
        NEEDS_MORE
      else
        TOO_MUCH
      end
    end

    def carbohydrates
      case @daily_intake.total_carbohydrates
      when 225..325
        PERFECT
      when 0..224
        NEEDS_MORE
      else
        TOO_MUCH
      end
    end

    def fats
      case @daily_intake.total_fats
      when 58..111
        PERFECT
      when 0..57
        NEEDS_MORE
      else
        TOO_MUCH
      end
    end

    def protein
      case @daily_intake.total_protein
      when 50..175
        PERFECT
      when 0..49
        NEEDS_MORE
      else
        TOO_MUCH
      end
    end
  end
end
