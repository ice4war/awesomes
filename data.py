import json
import os

base = "./src/posts"
files = os.listdir(base)
data = {}
for f in files:
    raw_data = open(f"{base}/{f}", "r").read()
    js_data = json.dumps(raw_data)
    key = f.split(".")[0]
    data[key] = js_data
with open("final.json", "w") as f:
    f.write(json.dumps(data))
