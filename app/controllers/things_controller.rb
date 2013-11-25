class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.json
  def create


    record = Loader.get(params[:base_url])

    @thing = Thing.create(
      :name => ActionController::Base.helpers.strip_tags(record['title'])
    )

    load_content(params[:base_url])

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thing }
      else
        format.html { render action: 'new' }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update

    load_content(params[:base_url])

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url }
      format.json { head :no_content }
    end
  end

  def sort_memberships
    @mem = Membership.find(params[:id])
    @mem.update_attribute :row_order_position, :first
    @mem.save
    redirect_to @mem.thing
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name, :lode, :scheme)
    end


    def load_content(url)

      org_url = url.split('/')[0..2].join('/')
      org_name = url.split('/')[2]
      org = Organization.where(:url => org_url, :name => org_name).first_or_create
      mem = nil
      if @thing.organizations.include? org_url
        mem = @thing.memberships.where(:organization => org)
      else
        mem = @thing.memberships.create(
          :organization => org, 
          :source_url => url
        )
      end

      record = Loader.get(url)
      record.each do |k, v|
        if v.class == Array and v.size == 1
          v = v.first
        end
        if v.class == String
          @thing.pieces.create(
            :predicate => ActionController::Base.helpers.strip_tags(k.dup),
            :original_predicate => ActionController::Base.helpers.strip_tags(k.dup),
            :content => ActionController::Base.helpers.strip_tags(v.dup),
            :membership_id => mem.id
          )
        end
      end
    end

end
