module BeforeRender
  extend ActiveSupport::Concern

  included do
    define_callbacks :render
    alias_method_chain :render, :before_render
  end

  def render_with_before_render(*options, &block)
    run_callbacks(:render) do
      render_without_before_render(*options, &block)
    end
  end

  module ClassMethods
    def before_render(*names, &block)
      _insert_callbacks(names, block) do |name, options|
        set_callback(:render, :before, name, options)
      end
    end
  end
end
