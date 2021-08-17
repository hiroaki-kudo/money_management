module TreasurersHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_treasurers_path
    elsif action_name == 'edit'
      treasurer_path
    end
  end
end
