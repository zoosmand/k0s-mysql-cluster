# -*- coding: utf-8 -*-

from mysql.connector import (connection, errorcode)
import sys

from dotenv import load_dotenv
import os
from pathlib import Path



# Load evironmental parameters
APP_ENVIRONMENT = os.getenv("ENV", "dev")

if APP_ENVIRONMENT == "dev":
    load_dotenv(".env.dev")
elif APP_ENVIRONMENT == "uat":
    load_dotenv(".env.uat")
elif APP_ENVIRONMENT == "prod":
    load_dotenv(".env.prod")
else:
    print("\n---\n\tPlease, define the environment variable\n\t e.g. export ENV=dev.\n\n")
    sys.exit(-1)

# Load common evironmental parameters
load_dotenv(override=True)


def connect(connection_config: dict) -> connection.MySQLConnection:
    """Connect to the MySQL Server using connetion attributes

    Returns:
        connection.MySQLConnection: A new Connection object
    """
    try:
        return connection.MySQLConnection(**connection_config)
    except connection.Error as e:
        print(e)
        sys.exit(-1)
    


def _sp():
    """Dump Stored Procedures
    """
    connection_config = {
        "user": os.getenv("MYSQL_USERNAME"), 
        "password": os.getenv("MYSQL_PASSWORD"),
        "host": os.getenv("MYSQL_SERVER"),
        "database": os.getenv("MYSQL_SCHEMA_DATABASE"),
        "raise_on_warnings": True
    }
    
    SP = "sp"

    cnx = connect(connection_config)
    if cnx and cnx.is_connected():
        with cnx.cursor() as cursor:

            _ = cursor.execute(f"""
                    SELECT
                        SPECIFIC_NAME AS sp_name,
                        ROUTINE_DEFINITION AS sp_text
                    FROM {connection_config["database"]}.ROUTINES
                    WHERE 
                        ROUTINE_SCHEMA = '{os.getenv("MYSQL_DATABASE")}'
                        AND ROUTINE_TYPE = 'PROCEDURE'
                """)

            rows = cursor.fetchall()
            for row in rows:
                Path(f"""{os.getenv("MYSQL_DATABASE")}/{SP}""").mkdir(parents=True, exist_ok=True)
                
                _ = cursor.execute(f"""
                    SELECT 
                        PARAMETER_MODE AS param_mode,
                        PARAMETER_NAME AS param_name,
                        DTD_IDENTIFIER AS param_type
                    FROM {connection_config["database"]}.PARAMETERS 
                    WHERE SPECIFIC_NAME = '{row[0]}'
                """)
                
                params = cursor.fetchall()
                param_head = f"""DROP PROCEDURE IF EXISTS {os.getenv("MYSQL_DATABASE")}.{row[0]};\n"""
                param_head += """DELIMITER $$\n$$\n"""
                param_head += f"""CREATE PROCEDURE {os.getenv("MYSQL_DATABASE")}.{row[0]}(\n"""
                for param in params:
                    param_head += f"""\t{param[1]} {param[2].upper()},\n"""
                param_head = param_head[:-2]
                param_head += """\n)\n"""
            
                with open(f"{os.getenv("MYSQL_DATABASE")}/{SP}/{row[0]}.sql", "w") as f:
                    f.write(param_head)
                    f.write("" if row[0] is None else row[1])
                    f.write("""\n$$\nDELIMITER ;\n""")
                    f.close()
    cnx.close()


def main():
    """The entry point of the application
    """
    _sp()

if __name__ == "__main__":
    main()