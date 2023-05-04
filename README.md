# Omni

Entire Omni Backend, including the code to initalize the database (postgres)

## Install

Before running the application, navigate to the `server/` directory. It is recommended that you use a [virtual environment](https://docs.python.org/3/library/venv.html).

Install dependencies by running this command:  
`pip install -r requirements.txt`

## Database

Create a `.env` file in `server/` and add the following environment variables
````
DB_NAME= name
DB_USER= username
DB_PASSWORD= password
DB_HOST= host
DB_PORT= port
````

To initilizate the database, import `database/omni_DDL.sql` file into [pgAdmin4](https://www.pgadmin.org/docs/pgadmin4/development/database_dialog.html).


## Run the app

    python manage.py runserver

