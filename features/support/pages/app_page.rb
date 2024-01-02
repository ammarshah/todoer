require_relative '../helpers/interaction_helper'

class AppPage < PageEz::Page
  include InteractionHelper

  has_one :add_todo_form, '#add-todo' do
    has_one :title_field, '.todo-title'
    has_one :add_button, '#todo-submit'

    # Since Capybara doesn't natively support clipboard so we
    # need to do copy and paste by sending keyboard shortcut keys
    def paste_title(title)
      title_field.set(title) # Set the title somewhere on the page
      send_keys [:control, 'a', 'c', 'v'] # Select all ('a'), then copy ('c'), then paste ('v')
    end
  end

  def add_todo(todo)
    add_todo_form.title_field.set(todo.title)
    add_todo_form.add_button.click
  end

  has_one :incomplete_todos_list, 'ul#incomplete-todos' do
    has_many :todos, 'li.todo' do
      has_one :status_checkbox, '.todo-status-checkbox'
      has_one :title_field, '.todo-title'
      has_one :delete_button, '.todo-actions .delete'

      def mark_complete
        status_checkbox.click
      end

      def delete
        hover
        delete_button.click
      end
    end

    def change_todo_title(from:, to:)
      todo_matching(text: from).title_field.set(to)
    end

    def update_todo_title(from:, to:)
      change_todo_title(from: from, to: to)
      press_key(key: 'enter')
    end
  end

  has_one :completed_todos_list, 'ul#completed-todos' do
    has_many :todos, 'li.todo' do
      has_one :status_checkbox, '.todo-status-checkbox'
      has_one :title_field, '.todo-title'
      has_one :delete_button, '.todo-actions .delete'

      def mark_incomplete
        status_checkbox.click
      end

      def delete
        hover
        delete_button.click
      end
    end

    def change_todo_title(from:, to:)
      todo_matching(text: from).title_field.set(to)
    end

    def update_todo_title(from:, to:)
      change_todo_title(from: from, to: to)
      press_key(key: 'enter')
    end
  end
end
