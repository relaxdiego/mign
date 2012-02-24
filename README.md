Mign
====
*I shall not fear. I shall be fine.  
Deadline draws near. Thank God for Mign!*

Got Xcode 4.2 or above?
-----------------------
You'll want to work around LLVM GCC. Here's [a suggestion](http://www.relaxdiego.com/2012/02/using-gcc-when-xcode-43-is-installed.html).

Prerequisites
-------------
1. Install Homebrew
2. `brew install postgres` (version 9.1.0 or above)
1. `brew install git`
2. Install RVM
3. `rvm install 1.9.3-p125`
4. `curl get.pow.cx | sh`

Installation
------------
1. `git clone https://github.com/relaxdiego/mign`
2. `cd mign` (if RVM asks, trust the .rvmrc file)
3. `script/setup`