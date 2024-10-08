module TodoHelper
  def title_attributes(todo)
    "#{title_class_attribute(todo)} #{title_other_attributes(todo) unless todo.completed?}".html_safe
  end

  def completed_attributes(todo)
    "#{completed_class_attribute(todo)}
    #{completed_style_attribute(todo)}
    data-todo-target=completedCheckbox
    data-action='click->todo#updateCompletedHiddenField click->todo#saveTodo'".html_safe
  end

  def title_original_value(todo)
    if todo.new_record?
      ""
    else
      todo.errors.any? ? @todo_before_update.title : todo.title
    end
  end

  def todo_was_marked_complete?(old_todo, new_todo)
    !old_todo.completed? && new_todo.completed?
  end

  def todo_was_marked_incomplete?(old_todo, new_todo)
    old_todo.completed? && !new_todo.completed?
  end

  private

  def title_class_attribute(todo)
    classes = "todo-title
      #{"field"     if todo.new_record?}
      #{"invalid"   if todo.errors.any?}
      #{"completed" if todo.completed?}".squish

    "class='#{classes}'".html_safe
  end

  def title_other_attributes(todo)
    method = todo.persisted? ? "blurTitleField" : "saveTodo"

    data_action = "input->todo#updateTitleHiddenField
      keydown.enter->todo##{method}
      keydown.shift+enter->todo##{method}
      keydown.ctrl+enter->todo##{method}
      keydown.alt+enter->todo##{method}
      keydown.ctrl+alt+enter->todo##{method}
      keydown.ctrl+shift+enter->todo##{method}
      keydown.shift+alt+enter->todo##{method}
      keydown.ctrl+alt+shift+enter->todo##{method}
      keydown.esc->todo#resetTitle
      keydown.esc->error#remove
      paste->todo#squishTitle
      #{"focusin->todo#hideCompletedCheckbox
      focusout->todo#showCompletedCheckbox
      focusout->todo#saveTodo" if todo.persisted?}".squish

    "contenteditable=true
    spellcheck=false
    placeholder='#{Tagline::DEFAULT_TAGLINE}'
    data-todo-target=titleField
    data-action='#{data_action}'".html_safe
  end

  def completed_class_attribute(todo)
    classes = "todo-status-checkbox
      #{"completed" if todo.completed?}".squish

    "class='#{classes}'".html_safe
  end

  def completed_style_attribute(todo)
    if todo.errors.any?
      styles = "opacity: 0; pointer-events: none;"

      "style='#{styles}'".html_safe
    end
  end
end
