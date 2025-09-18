import psutil

def disk_usage(path):
    hdd = psutil.disk_usage(path)

    print(f"Total disk space on the device is: {hdd.total//1024**3} GiB")
    print(f"Total free disk space on the device is: {hdd.free//1024**3} GiB")
    print(f"Total used disk space on the device is: {hdd.used//1024**3} GiB")
    print(f"Total percentage free disk space on the device is: {hdd.free/hdd.total*100:.2f} %")


if __name__ == "__main__":
    menu_text = """Select which menu you would like to use:
    ************************************************
    1. Check the disk usage
    2. Check the running service
    3. Check the RAM and swap information
    4. Check CPU utilization
    ************************************************"""

    user_input = input(menu_text + "\n")
    if int(user_input) ==1:
        disk_usage('/')