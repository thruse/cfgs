import os
import shutil

def main():
    os.makedirs(".vscode", exist_ok=True)
    settings_destination = ".vscode/settings.json"
    if os.path.exists(settings_destination):
        print(f"error: {settings_destination} already exists")
    else:
        shutil.copyfile(os.path.join(os.environ.get("CFGSDIR"), "settings.json"), settings_destination)

if __name__ == "__main__":
    main()