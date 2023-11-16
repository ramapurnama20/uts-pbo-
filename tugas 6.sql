from sqlalchemy import create_engine, Column, Integer, String, Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Buat engine untuk SQLite (ganti sesuai dengan database yang Anda gunakan)
engine = create_engine('sqlite:///example.db', echo=True)

# Mendefinisikan model data
Base = declarative_base()

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, Sequence('user_id_seq'), primary_key=True)
    name = Column(String(50))
    age = Column(Integer)

# Membuat tabel (jika belum ada)
Base.metadata.create_all(engine)

# Membuat sesi untuk berinteraksi dengan database
Session = sessionmaker(bind=engine)
session = Session()

# Contoh menambahkan data
new_user = User(name='John Doe', age=25)
session.add(new_user)
session.commit()

# Contoh query data
users = session.query(User).all()
for user in users:
    print(f"ID: {user.id}, Name: {user.name}, Age: {user.age}")

# Tutup sesi
session.close()
