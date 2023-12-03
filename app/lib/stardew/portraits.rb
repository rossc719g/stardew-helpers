# frozen_string_literal: true

class Stardew
  # Read portrait files
  class Portraits
    PATH = Rails.root.join "data/portraits"

    class << self
      def path(name)
        PATH.join "#{name}.png"
      end

      def valid?(name)
        valid_portraits.include? name
      end

      def valid_portraits
        @valid_portraits ||= Dir[PATH.join "*.png"].map { |f| File.basename f, ".png" }
      end
    end
  end
end
