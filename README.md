## before_filter in Ruby on Rails 4

Add a hook method like `before_action` or `after_action` to controllers.

`before_render` is called when:
- After the action is finished and,
- Before the view is rendered

### Usage
- Put before_render.rb to app/controllers/concerns
- Write code like follows in controllers

```ruby
class UsersController < ApplicationController
  include BeforeRender

  before_render :foo, only: [:show]
  before_render unless: [:destroy] do |controller|
  bar
  end

  def foo
  end

  def bar
  end
end
```
