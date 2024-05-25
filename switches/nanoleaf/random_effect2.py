import requests
import json
import time
import random

#shapes/elements/lines
nanoleaf = [["192.168.1.119","6pvsW4WFnGkL1MsMzeYlN3MqEgQE39lS"],["192.168.1.141","jRZY0kv756ZhmWCf3vjqLJuDXryMxYEd"],["192.168.1.144","5Oa4IiYska9z8S9v7d3GMrZThXtOg3Yg"]]
#nanoleaf = [["192.168.1.119","6pvsW4WFnGkL1MsMzeYlN3MqEgQE39lS"],["192.168.1.141","pOKkC4XTQ4I9c4y4WHQMQk18HYI10rQx"]]

for device in nanoleaf:
  ip = device[0]
  token = device[1]

  url = "http://"+ip+":16021/api/v1/"+token

  payload={}
  headers = {}

  print(ip+":")
  try:
    response = requests.get(url, headers=headers, data=payload, timeout=10)
    if (response.status_code == 200):
      light = json.loads(response.text)
      on = light["state"]["on"]["value"]

      if on == True:
        effectsList = light["effects"]["effectsList"]
        effect = effectsList[random.randint(0, len(effectsList)-1)]

        url = "http://"+ip+":16021/api/v1/"+token+"/effects"

        payload="{\"select\" : \""+effect+"\"}"
        headers = {
          'Content-Type': 'text/plain'
        }

        response = requests.put(url, headers=headers, data=payload, timeout=10)
        print("  random ok")
      else:
        print("  off nothing to do")
    else:
      print("  error "+str(response.status_code)+" for ip:"+ip)
  except:
    print("  random ko")