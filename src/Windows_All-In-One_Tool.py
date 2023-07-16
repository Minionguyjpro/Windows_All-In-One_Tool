import os
import sys
import time

def check_os():
    if os.name != "nt":
        print("This script only works on Windows.")
        sys.exit()

def get_username():
    return os.environ["username"]

def get_time():
    return time.strftime("%H:%M:%S")

def get_date():
    return time.strftime("%d/%m/%Y")

def print_menu():
    print("""
    **Windows All-In-One Tool** by Minionguyjpro
    
    **1. DISM and SFC Repair** | [1]
    **2. Create Restore Point** | [2]
    **3. Windows IP Configuration** | [3]
    **4. User List** | [4]
    **5. Check Windows Version** | [5]
    **6. Ping Tool** | [6]
    **7. Delete DNS cache** | [7]
    **8. Open Terminal** | [8]
    **9. Credits** | [9]
    **10. Tool Information** | [10]
    **11. Exit** | [11]
    """)

def get_task():
    task = str(input("Enter a number: "))
    return task

def run_task(task):
    if task == "1":
        os.system("dism.exe /Online /Cleanup-image /Restorehealth")
        os.system("sfc.exe /scannow")
    elif task == "2":
        restorepointname = input("What name do you want for the restore point (leave empty to name it 'Restore Point')? ")
        if restorepointname == "":
            restorepointname = "Restore Point"
        os.system('wmic.exe /Namespace:\\\\root\\default Path SystemRestore Call CreateRestorePoint "{0}"'.format(restorepointname))
    elif task == "3":
        os.system("ipconfig.exe")
    elif task == "4":
        os.system("wmic.exe userAccount get Name")
    elif task == "5":
        os.system("winver")
    elif task == "6":
        ping_tool = input("Enter a website to ping or use arguments and subcommands for the 'ping' command "
                          "Do not include 'ping' in command: ")
        if ping_tool.lower() == "exit":
            return
        os.system("ping " + ping_tool)
    elif task == "7":
        os.system("ipconfig.exe /flushdns")
    elif task == "8":
        if os.system("cmd.exe") == 0:
            return "cmd.exe"
        elif os.system("pwsh.exe") == 0:
            return "pwsh.exe"
        else:
            return None
    else:
        return None

def main():
    check_os()
    username = get_username()
    time = get_time()
    date = get_date()
    print("Hello there, {}!".format(username))
    print("The current time is", time)
    print("And the current date is", date)
    print_menu()
    task = get_task()
    print("Running task:", task)
    run_task(task)
    print("Done!")

if __name__ == "__main__":
    main()
