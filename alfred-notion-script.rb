require "uri"
require "json"
require "net/http"

bearer_token = ENV["BEARER_TOKEN"]
database_id = ENV["DATABASE_ID"]

request_args = "{query}"

request_array = request_args.split(';')

# Input looks like this:
# 
# ntn Category;This is the title;This is the body of the request 
#
# 0 - category
# 1 - title
# 2 - body

category = request_array[0]
title = request_array[1]

# Make sure that there actually is a body
if (request_array.length > 2)
	body = request_array[2]
else
	body = ""
end

url = URI("https://api.notion.com/v1/pages")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Notion-Version"] = "2021-08-16"
request["Authorization"] = "Bearer " + bearer_token
request.body = JSON.dump({
  "parent": {
    "database_id": database_id
  },
  "properties": {
    "Name": {
      "title": [
        {
          "text": {
            "content": title
          }
        }
      ]
    },
    "Status": {
      "select": {
        "name": "Organize"
      }
    },
    "Category": {
      "select": {
        "name": category
      }
    }
  },
  "children": [
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "text": [
          {
            "type": "text",
            "text": {
              "content": body
            }
          }
        ]
      }
    }
  ]
})

response = https.request(request)
puts response.read_body