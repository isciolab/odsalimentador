class Goal < ApplicationRecord
    validates :name, presence: true, uniqueness: true, :if=> 'self.changed?'
    validates :number, presence: true, uniqueness: true,:if=> 'self.changed?'
    has_many  :target

    def paid_with_card?
        delete_at.nil?
    end

    before_validation :isnotdelete

    protected
    def isnotdelete
        if delete_at.nil?
            self.login = email unless email.blank?
        end
    end

end
