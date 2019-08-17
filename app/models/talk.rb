class Talk < ApplicationRecord

  belongs_to :user

  validates :content, presence:true

  scope :talk_matchers, ->(current_user, params_id){where(myself_id:  current_user).where(partner_id: params_id)
            .or(Talk.where(partner_id:  current_user).where(myself_id: params_id))
            .order(id: "DESC")}

end
