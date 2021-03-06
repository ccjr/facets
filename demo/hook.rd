= Hook Library

Require the hook.rb library.

  require 'facets/hook'

Build a class with signals.

  class X
    include Hook

    def course
      @course ||= []
    end

    hook :signal

    def boom(event, message)
      course << "Kaboom!"
    end

    signal do |event, message|
      course << ["1", event, message]
    end

    signal do |event, message|
      course << ["2", event, message]
    end

    signal :boom

  end

Triger the signal.

  x = X.new
  x.signal("hi")

The hooks should have been fired.

  x.course[0].should == ["1", :signal, "hi"]
  x.course[1].should == ["2", :signal, "hi"]
  x.course[2].should == "Kaboom!"
  x.course[3].should == nil
  
QED.

