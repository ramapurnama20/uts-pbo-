from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Konfigurasi database (ganti sesuai kebutuhan)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///example.db'
db = SQLAlchemy(app)

# Model data
class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String(200), nullable=False)

# Membuat tabel (jika belum ada)
db.create_all()

@app.route('/')
def index():
    tasks = Task.query.all()
    return render_template('index.html', tasks=tasks)

@app.route('/add', methods=['POST'])
def add():
    content = request.form['content']
    new_task = Task(content=content)
    db.session.add(new_task)
    db.session.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Task App</title>
</head>
<body>
    <h1>Tasks</h1>
    <ul>
        {% for task in tasks %}
            <li>{{ task.content }}</li>
        {% endfor %}
    </ul>
    <form action="/add" method="post">
        <label for="content">Task:</label>
        <input type="text" id="content" name="content" required>
        <button type="submit">Add Task</button>
    </form>
</body>
</html>
