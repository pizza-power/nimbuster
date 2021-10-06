import httpclient
import parseopt
import strutils
import system
    
var p = initOptParser()
var wordlist: string
var url: string

while true:
  p.next()
  case p.kind
  of cmdEnd: break
  of cmdShortOption, cmdLongOption:
    if p.key == "u":
      url = p.val
    if p.key == "w":
      wordlist = p.val
  of cmdArgument:
    echo ""

let contents = readFile(wordlist)
let words = contents.splitLines()

var final_url: string
var client = newHttpClient(timeout = 100)

for i in 0 ..< words.len:
    final_url = url & "/" & words[i]
    try:
        let response = client.request(final_url, httpMethod = HttpGet)
        let status_code = response.status.split(' ')[0]
        if status_code == "200":
            echo final_url
    except:
        echo ""
