from sqlalchemy import create_engine, MetaData
import pandas as pd
import json
engine = create_engine("mysql+pymysql://root:root@localhost:3306/PI_DTS_03")

meta = MetaData()

conne = engine.connect()







