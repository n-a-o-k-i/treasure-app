class Api::V1::MembersController < ApiController
  before_action :set_member, only: [:show, :update, :destroy]

  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    members = Member.select(:id, :name, :age, :department, :gender, :grade, :joined_date, :birth )
    render json: members
  end

  def show
    render json: @member
  end

  def create
    member = Member.new(member_params)
    if member.save
      render json: member, status: :created
    else
      render json: { errors: member.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @member.update_attributes(member_params)
      head :no_content
    else
      render json: { errors: @member.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @member.destroy!
    head :no_content
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.fetch(:member, {}).permit(:name, :age, :department, :gender, :birth, :joined_date, :grade, :address, :tel)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end