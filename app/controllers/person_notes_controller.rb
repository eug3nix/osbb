class PersonNotesController < ApplicationController
  before_action :set_person_note, only: [:show, :edit, :update, :destroy]

  # GET /person_notes
  # GET /person_notes.json
  def index
    @person_notes = PersonNote.all
  end

  # GET /person_notes/1
  # GET /person_notes/1.json
  def show
  end

  # GET /person_notes/new
  def new
    @person_note = PersonNote.new
  end

  # GET /person_notes/1/edit
  def edit
  end

  # POST /person_notes
  # POST /person_notes.json
  def create
    @person_note = PersonNote.new(person_note_params)

    respond_to do |format|
      if @person_note.save
        format.html { redirect_to @person_note, notice: 'Person note was successfully created.' }
        format.json { render :show, status: :created, location: @person_note }
      else
        format.html { render :new }
        format.json { render json: @person_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_notes/1
  # PATCH/PUT /person_notes/1.json
  def update
    respond_to do |format|
      if @person_note.update(person_note_params)
        format.html { redirect_to @person_note, notice: 'Person note was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_note }
      else
        format.html { render :edit }
        format.json { render json: @person_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_notes/1
  # DELETE /person_notes/1.json
  def destroy
    @person_note.destroy
    respond_to do |format|
      format.html { redirect_to person_notes_url, notice: 'Person note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_note
      @person_note = PersonNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_note_params
      params.require(:person_note).permit(:text, :person_id)
    end
end
