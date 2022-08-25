class MembershipsController < ApplicationController
  validates :charge, presence: :true
  validates :client_id, presence: :true, uniqueness: true
  validates :gym_id, presence: :true
  

  # POST /memberships
  def create

    membership = Membership.create(membership_params)

    if membership.exists?
      render json: membership, status: :created
    else
      render json: membership.errors, status: :unprocessable_entity
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def membership_params
      params.require(:membership).permit(:charge, :gym_id, :client_id)
    end
end
