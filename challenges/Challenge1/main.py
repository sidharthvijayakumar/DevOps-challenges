import os
import sys

import psutil
import logging
import datetime

logging.basicConfig(
    filename="system_health.log",
    level=logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s"
)
def disk_usage(path,file_name):
    try:

        hdd = psutil.disk_usage(path)
        with open(file_name, "a") as f:
            f.write("******************DISK USAGE************************\n")
            f.write(f"Total disk space on the device is: {(hdd.total//1024**3)} GiB\n")
            f.write(f"Total free disk space on the device is: {hdd.free//1024**3} GiB\n")
            f.write(f"Total used disk space on the device is: {hdd.used//1024**3} GiB\n")
            f.write(f"Total percentage free disk space on the device is: {hdd.percent:.2f} %\n")
            f.write("******************DISK USAGE************************\n")
        #Print the result on the console
        with open(file_name,"r") as r:
            print(r.read())
    except psutil.Error as error:
        logging.error(f"psutil error while reading disk stats: {error}")
        print(f"Could not retrieve disk usage: {error}")
    except FileNotFoundError as error:
        logging.error(f"Unable to find : {error}")
        print(f"Could not retrieve disk usage: {error}")
    except Exception as error:
        logging.error(f"Unexpected error: {error}")
        print(f"Unexpected error: {error}")


def process_running(file_name):
    try:

        with open(file_name,"a") as f:
            f.write("******************PROCESS RUNNING************************\n")
            for proc in psutil.process_iter(['pid', 'name', 'username']):
                f.write(f"{str(proc.info)}\n")
            f.write("******************PROCESS RUNNING************************\n")
        with open(file_name,"r") as r:
            print(r.read())
    except psutil.Error as error:
        logging.error(f"psutil error while reading process stats: {error}")
        print(f"Could not retrieve process stats: {error}")
    except FileNotFoundError as error:
        logging.error(f"Unable to find : {error}")
        print(f"Could not retrieve process stats: {error}")
    except Exception as error:
        logging.error(f"Unexpected error: {error}")
        print(f"Unexpected error: {error}")


if __name__ == "__main__":
    timeStamp=datetime.datetime.utcnow().isoformat()
    file_name=f"Systemhealth-{timeStamp}.txt"
    print(f"Processing {file_name}")
    menu_text = """Select which menu you would like to use:
    ************************************************
    1. Check the disk usage
    2. Check the running service
    3. Check the RAM and swap information
    4. Check CPU utilization
    ************************************************"""
    try:
        choice = input(menu_text + "\n")
        if int(choice) ==1:
            disk_usage('/',file_name)
        elif int(choice) == 2:
            process_running("Systemhealth.txt")
        else:
            raise Exception
    except Exception as error:
        logging.error(f"Unexpected error: {error}")
        print(f"Unexpected input. Please enter 1-2: {error}")