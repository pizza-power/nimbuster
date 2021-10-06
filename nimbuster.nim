import httpclient
import parseopt
import strutils
import system
    
var p = initOptParser()
var wordlist: string
var url: string
var extensions: string
var extension_array: seq[string]
var write_to_file: bool

while true:
  p.next()
  case p.kind
  of cmdEnd: break
  of cmdShortOption, cmdLongOption:
    if p.key == "u":
      url = p.val
    if p.key == "w":
      wordlist = p.val
    if p.key == "x":
      extensions = p.val
      extension_array = extensions.split(',')
    if p.key == "o":
      write_to_file = true
  of cmdArgument:
    echo ""

let contents = readFile(wordlist)
let words = contents.splitLines()

var final_url: string
var client = newHttpClient(timeout = 100)

for i in 0 ..< words.len:
  if extension_array.len > 0:
    for j in 0 ..< extension_array.len:
      final_url = url & "/" & words[i] & "." & extension_array[j]
      try:
          let response = client.request(final_url, httpMethod = HttpHead)
          let status_code = response.status.split(' ')[0]
          if status_code == "200":
            if write_to_file:
              let f = open("output.txt", fmAppend)
              defer: f.close()
              f.writeLine(final_url)
            else:
              echo final_url
      except:
          echo ""
  else:
    final_url = url & "/" & words[i]
    try:
        let response = client.request(final_url, httpMethod = HttpHead)
        let status_code = response.status.split(' ')[0]
        if status_code == "200":
          if write_to_file:
            let f = open("output.txt", fmAppend)
            defer: f.close()
            f.writeLine(final_url)
          else:
            echo final_url
    except:
        echo ""