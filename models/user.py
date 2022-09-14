from sqlalchemy import Table,Column
from sqlalchemy.sql.sqltypes import Integer, String
from config.database import meta, engine

users = Table("users", meta, Column(
    "id", Integer, primary_key=True), 
    Column("name", String(255)),
    Column("password", String(255)),
    Column("asdas", String(255))) 