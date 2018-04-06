class SkillsController < ApplicationController

  def show
    @skill = Skill.find_by(name: params[:id])
    @designers = @skill.designers
  end

end