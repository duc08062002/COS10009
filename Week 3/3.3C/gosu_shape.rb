require 'rubygems'
require 'gosu'
require './circle'

module ZOrder
    BACKGROUND, MIDDLE, TOP = *0..2
  end
  class DemoWindow < Gosu::Window
    def initialize
      super(800, 500, false)
    end  
    def draw
        draw_quad(0, 0, 0xff_ffffff, 800, 0, 0xff_ffffff, 0, 500, 0xff_ffffff, 800, 500, 0xff_ffffff, ZOrder::BACKGROUND)
        draw_quad(0, 250, 0xff_808080, 800, 250, 0xff_808080, 0, 300, 0xff_808080, 800, 300, 0xff_808080, ZOrder::MIDDLE )
        Gosu.draw_rect(75, 185, 200, 50, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
        Gosu.draw_rect(125, 135, 100, 50, Gosu::Color::BLUE, ZOrder::MIDDLE, mode=:default)
        draw_triangle(125, 135, Gosu::Color::GREEN, 125, 185, Gosu::Color::GREEN, 100, 185, Gosu::Color::GREEN, ZOrder::MIDDLE, mode=:default)
        draw_triangle(225, 135, Gosu::Color::GREEN, 225, 185, Gosu::Color::GREEN, 250, 185, Gosu::Color::GREEN, ZOrder::MIDDLE, mode=:default)
        Gosu.draw_rect(275, 195, 5, 30, Gosu::Color::CYAN, ZOrder::MIDDLE, mode=:default)
        draw_line(280, 195, Gosu::Color::YELLOW, 800, 100, Gosu::Color::YELLOW, ZOrder::TOP, mode=:default)
        draw_line(280, 225, Gosu::Color::YELLOW, 800, 300, Gosu::Color::YELLOW, ZOrder::TOP, mode=:default)

        img2 = Gosu::Image.new(Circle.new(50))
        img2.draw(100, 225, ZOrder::TOP, 0.5, 0.5, 0xff_000000)
        img2.draw(200, 225, ZOrder::TOP, 0.5, 0.5, 0xff_000000)
        


    end
end
DemoWindow.new.show