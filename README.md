# Easy Vim scripting with Ruby [![Build Status](https://travis-ci.org/begriffs/vim_r.png)](https://travis-ci.org/begriffs/vim_r)

Nobody really likes VimL, so try VimR.

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
