import picamera
from zipfile import ZipFile
import os
import datetime

now = datetime.now()
now = now.strftime("%Y_%m_%d_%H_%M_%S")

filename = now + "_test.h264"
directory = "/home/pi/base/videos/"
camera = picamera.PiCamera()
os.chdir(directory)
camera.start_recording(filename)
time.sleep(60)
camera.stop_recording()

os.chdir("/home/pi/base/videos/")
with ZipFile("test_zip.zip", 'w') as zipf:
    zipf.write(os.path.join(directory,filename), arcname=filename)
