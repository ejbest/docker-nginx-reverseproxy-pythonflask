import requests
import hashlib
import os

url='http://localhost:5000/data'

req=requests.get(url, verify=False)

data=req.json()

samples=data.get('samples')

data_store="./files"

if not os.path.exists(data_store):
  os.mkdir(data_store)
  print(f"Folder {data_store} created!")

for item in samples:
    with open(f"{data_store}/{item.get('id')}.txt", "w") as file:
        file.write(item.get('name'))
    file.close

for item in samples:
    with open(f"{data_store}/{item.get('id')}.txt","rb") as file:
        bytes = file.read()
        readable_hash = hashlib.sha256(bytes).hexdigest();
        if readable_hash == item.get('id'):
            print("successful parse!")
        else:
            print("some error occured, please check your endpoint")

