import json, socket, time
import datetime as dt

DEBUG = False
SERIAL = 0
WIFI = 1
### ip and port of wled
### 21324 is the default port of wled
LINK_MODE = WIFI

WLED_IP='192.168.1.131'
#WLED_IP='192.168.1.121'
WLED_PORT=21324

### led strip configuration
### number of leds on the strip
NB_LEDS = 84
DURATION = 30
STEP_DURATION = 0.5

WLED_UDP_MODE_WARLS = 1
WLED_UDP_WAIT = 1

PINK = [45,11,48]
BLACK = [0,0,0]

COLOR1 = PINK
COLOR2 = BLACK

TIME_SLEEP=0.005

def sendByWifi(clientSock, Message):
    clientSock.sendto(Message, (WLED_IP, WLED_PORT))

if __name__ == "__main__":
    clientSock = socket.socket (socket.AF_INET, socket.SOCK_DGRAM)

    stop = False
    now = dt.datetime.now()
    now_step = dt.datetime.now()
    while not stop:
        v = [WLED_UDP_MODE_WARLS,WLED_UDP_WAIT]
        now2 = dt.datetime.now()
        elapsed_sec = (now2-now_step).total_seconds()
        if elapsed_sec > STEP_DURATION:
            now_step = dt.datetime.now()
            elapsed_sec = 0
        i_color1 = NB_LEDS    
        for i in range(NB_LEDS):
            if i < (elapsed_sec * NB_LEDS / STEP_DURATION) or i > i_color1:
                color = COLOR2
            else:
                color = COLOR1
                i_color1 = i
            v.extend([i])
            v.extend(color)

        Message = bytearray(v)
        sendByWifi(clientSock,Message)
        now2 = dt.datetime.now()
        elapsed_sec = (now2-now).total_seconds()
        if elapsed_sec > DURATION: stop = True

        time.sleep(TIME_SLEEP)

               
