import pandas as pd
from sqlalchemy import Table,Column
from sqlalchemy.sql.sqltypes import Integer, String
from config.database import meta, engine

circuits = Table("circuit", meta, 
        Column("Idcircuit", Integer, primary_key=True), 
        Column("Refcircuit", String(255)),
        Column("Name", String(255)),
        Column("Location", String(255)),
        Column("Country", String(255)),
        Column("Latitud", String(255)),
        Column("Longitud", String(255)),
        Column("Altitud", String(255)),
        Column("URL", String(255))) 

races = Table("race", meta, 
        Column("Idrace", Integer, primary_key=True), 
        Column("Year", Integer),
        Column("Round", String(255)),
        Column("Idcircuit", String(255)),
        Column("Name", String(255)),
        Column("Date", String(255)),
        Column("Time", String(255)),
        Column("URL", String(255)))

