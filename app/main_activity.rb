class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super

    layout = Android::Widget::LinearLayout.new(self)
    layout.orientation = Android::Widget::LinearLayout::VERTICAL

    text_view = Android::Widget::TextView.new(self)
    text_view.text = "The Chameleon"
    text_view.textSize = 25
    layout.addView(text_view)

    button = Android::Widget::Button.new(self)
    button.text = "Colorize"
    button.onClickListener = IncreaseButtonListener.new(text_view)
    layout.addView(button)

    self.contentView = layout
  end
end

class IncreaseButtonListener
  attr_reader :text_view

  def initialize(text_view)
    @text_view = text_view
  end

  def onClick(_view)
    @text_view.textColor = Android::Graphics::Color.rgb(rand(255), rand(255), rand(255))
  end
end
