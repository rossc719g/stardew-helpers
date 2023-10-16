module Stardew
  class ScheduleGroup
    attr_accessor :schedules

    class << self
      def group(schedules)
        groups = []
        schedules.each do |possibility|
          if !groups.empty? && possibility.rain? && groups.last.rain?
            groups.last.schedules << possibility
            next
          end

          groups.push self.new(possibility)
        end

        groups
      end
    end

    def initialize(schedule)
      @schedules = [schedule]
    end

    def two_possibilities?
      @schedules.length == 2
    end

    def notes
      @schedules.first.notes
    end

    def rain?
      @schedules.first.rain?
    end

    def to_partial_path
      'group'
    end
  end
end
