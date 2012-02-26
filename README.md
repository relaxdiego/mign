Mign
====
*The deadline is near<br/>
All tasks must align<br/>
Disruptions appear<br/>
Good thing I use Mign!*

Prerequisites
-------------
1. [Mac OS X](http://www.apple.com)
2. [PostgreSQL](www.postgresql.org/) 9.1.0+
3. [Git](http://git-scm.com) 1.7.9+
4. [RVM](http://beginrescueend.com/) 1.10.2+
5. [Ruby](ruby-lang.org/) 1.9.3-p125 (Should be managed by RVM)
6. [Pow](http://pow.cx/) 0.3.2+

Got Xcode 4.2 or above?
-----------------------
You'll want to work around LLVM GCC. Here's [a suggestion](http://www.relaxdiego.com/2012/02/using-gcc-when-xcode-43-is-installed.html).

Installation
------------
1. `git clone https://github.com/relaxdiego/mign`
2. `cd mign` (if RVM asks, trust the .rvmrc file)
3. `script/setup`

Usage
-----
Point your browser to `http://mign.dev`

Found a bug?
------------
Report it [here](https://github.com/relaxdiego/mign/issues).

Getting updates
------------
1. `git pull origin master`
2. `script/setup`

Development
-----------
1. `script/spork`
3. Open another terminal and `cd` to Mign
4. `script/runtests`
5. Start coding using your favorite editor

The tests will run in full, regenerate the code coverage report which is saved in the `coverage` directory, then pause and wait for you to make changes to to the code. When a change is detected, it will run part or all of the tests depending on which part of the code you changed, regenerate the code coverage etc etc etc. You get the point now, right?

Contributing
------------
1. Fork `https://github.com/relaxdiego/mign`
2. Create a branch for whatever it is you plan to do
3. Change stuff
4. Send a pull request. If I like it, I will merge to my master branch

Criteria for judging a contribution
-----------------------------------
1. Covered by tests. Use rspec only.
2. All tests must pass.
3. Must come with a poem/haiku. I'm just kidding, but there's `public/poetry.yml` if you really want to. ;-)

Helpful references for development
----------------------------------
1. [Capybara DSL](http://rubydoc.info/github/jnicklas/capybara/master)
2. [Rspec-Rails](http://rubydoc.info/gems/rspec-rails/frames)
3. [Factory Girl](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md)

License
-------
(The MIT license)

Copyright (c) 2012 Mark S. Maglana

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.