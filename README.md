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

Getting updates
------------
1. `git pull origin master`
2. `script/setup`


Development
-----------
1. `script/spork`
3. Open another terminal and `cd` to Mign
4. `script/runtest`
5. Start coding using your favorite editor

License
-------
(The MIT license)

Copyright (c) 2012 Mark S. Maglana

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.