from sqlalchemy import create_engine, MetaData

engine = create_engine("mysql+pymysql://root:root@localhost:3306/PI_DTS_03")

conne = engine.connect()

meta = MetaData()






