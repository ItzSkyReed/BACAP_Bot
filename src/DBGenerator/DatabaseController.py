from pathlib import Path
from datetime import datetime


class DatabaseController:
    # Folder for storing old databases
    old_db_folder = Path("db_old")
    # Path to the current database
    current_db_path = Path("database.db")

    @staticmethod
    def generate_old_db_name():
        # Generate a filename for the old database based on the current date and time
        return datetime.now().strftime("database%d_%m_%Y_%H_%M_%S.db")

    @classmethod
    def update_current_db(cls):
        # Create the folder for old databases if it doesn't exist
        cls.old_db_folder.mkdir(parents=True, exist_ok=True)

        # If the current database exists, move it to the old databases folder
        if cls.current_db_path.exists():
            old_db_name = cls.generate_old_db_name()
            old_db_path = cls.old_db_folder / old_db_name
            cls.current_db_path.rename(old_db_path)
            print(f"Old database moved to: {old_db_path}")

        # Create a new empty database file named "database.db"
        cls.current_db_path.touch()
        print(f"New database created: {cls.current_db_path}")

        # Manage old backups
        cls.manage_backups()

    @classmethod
    def manage_backups(cls):
        # Get all files in the old databases folder
        backup_files = sorted(
            [f for f in cls.old_db_folder.glob('*.db')],
            key=lambda x: x.stat().st_mtime,
            reverse=True
        )

        # If there are more than 10 old databases, delete the oldest ones
        if len(backup_files) > 10:
            for file_to_delete in backup_files[10:]:
                file_to_delete.unlink()
                print(f"Old database deleted: {file_to_delete}")

    @classmethod
    def get_current_db(cls):
        return cls.current_db_path