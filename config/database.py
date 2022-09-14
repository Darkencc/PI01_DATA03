from sqlalchemy import create_engine, MetaData

engine = create_engine("mysql+pymysql://root:root@localhost:3306/henry_m3")

meta = MetaData()

conne = engine.connect()