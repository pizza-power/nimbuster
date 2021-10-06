# nimbuster
A directory and file enumeration utility written in nim.

Why did I create this program? I wanted to learn nim. Every other language has a directory/file enumeration program. I couldn't find one for nim, so here we are. 

## to run

**install Nim**

https://nim-lang.org/install.html

**clone this repo**

```git clone https://github.com/pizza-power/nimbuster.git```

**compile nimbuster.nim**

```nim c -d:release -d:ssl nimbuster```

**run**

``` ./nimbuster -u:https://pizzapower.me -w:/path/to/your/wordlist```

to search for files
``` ./nimbuster -u:https://pizzapower.me -w:/path/to/your/wordlist -x:txt,jpeg```

output to a file - hardcoded as output.txt right now

``` ./nimbuster -u:https://pizzapower.me -w:wordlist.txt -o ```

**alternate method**

Download the latest release. It has only been tested on Ubuntu 21.04. It may not be up to date with the current source code. 

## todo

Pretty much everything
