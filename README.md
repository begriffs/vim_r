# Easy Vim scripting with Ruby

Nobody really likes VimL, so try VimR, a gem to script Vim with Ruby.

## Usage

If your vim is compiled with Ruby support then you can embed Ruby code
inside VimL and use the VimR library.

```
ruby require 'rubygems'; require 'vim_r'
function! GoMiddle()
  ruby << RUBY
    w = VimL::Window.current
    w.cursor 0, w.buffer.length / 2
RUBY
endfunction
```
