class PagesController < ApplicationController
  def home
    @notes = Note.order(created_at: :desc)
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to root_path, notice: "Note saved."
    else
      @notes = Note.order(created_at: :desc)
      render :home, status: :unprocessable_entity
    end
end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
