require "vim_r/version"

module VimR
  module Windows
    include Enumerable

    def self.each
      # the internal object doesn't support enumerable
      (0 ... count).each do |i|
        yield Window.new self[i]
      end
    end

    def self.current
      Window.new VIM::Window.current
    end

    def self.[] i
      Window.new VIM::Window[i]
    end

    def self.method_missing method, *args, &block
      @win.send method, *args, &block
    end
  end

  class Window
    def initializer vimw
      @win = vimw
    end

    def == other
      @win == other.win
    end

    def buffer
      Buffer.new @win.buffer
    end

    def method_missing method, *args, &block
      @win.send method, *args, &block
    end
  end

  class Buffer

  end

  module Selection
    def self.mode
      # :visual, :block_visual, :linewise_visual, or :none
      case VIM::evaluate 'mode()'
      when 'v':
        :visual
      when 'V':
        :block_visual
      when 22.chr: # CTRL-v
        :linewise_visual
      else:
        :none
      end
    end

    def start

    end
  end
end
