class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in

  # GET /people
  # GET /people.json
  def index
    #redirect_if_not_logged_in
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    #redirect_if_not_logged_in
  end

  # GET /people/new
  def new
    #redirect_if_not_logged_in
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    #redirect_if_not_logged_in
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @book = Book.find_by(person_id: @person.id)
    if(@book != nil)
      respond_to do |format|
        format.html { redirect_to people_url, notice: 'Person can not be deleted. Books assigned.' }
        format.json { head :no_content }
      end
    else
      @person.destroy
      respond_to do |format|
        format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:empid, :name, :lastname, :phone, :login, :password, :admin)
    end
end
