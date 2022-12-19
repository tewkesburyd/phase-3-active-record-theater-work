class Roles
    has_many :audition

    def actors
        audition.actors.map do |t|
            t.actor
        end
    end

    def locations
        audition.locations.map do |t|
            t.location
    end

    def lead
        auditions.find_by(hired: true) || 'no actor has been hired for this role'
    end

    def understudy
        auditions.where(hired: true).second || 'no actor has been hired for understudy for this role'
    end
end