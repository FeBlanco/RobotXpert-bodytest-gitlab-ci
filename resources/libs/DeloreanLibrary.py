import psycopg2
from logging import info 

class DeloreanLibrary():
    # metodo para conectar ao banco de dados
    def connect(self):
        return psycopg2.connect(
            host='ec2-34-193-113-223.compute-1.amazonaws.com',
            database='d3lkldig33d101',
            user='mfvkxjoocjkulo',
            password='c3a1855e577a25f5a8ae17ebb13b3521c472fc413d9f152c68cacfe60439617e'
        )

    # No Robot vira uma KW automáticamente => Remove Student email@desejado.com
    def remove_student(self, email):
        
        query = "delete from students where email = '{}'".format(email)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()
        

    def remove_student_by_name(self, name):
         
        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students  (name, email, age, weight, feet_tall, created_at, updated_at) "
            "values('{}', '{}','{}', '{}', '{}', NOW(),NOW());"
            .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall']))
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    ####### PLANOS  #########
    def remove_plan(self, title):
        
        query = "delete from plans where title = '{}'".format(title)
        info(query)
        
        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_plan_by_title(self, title):
    
        query = "delete from plans where title LIKE '%{}%'".format(title)
        info(query)
        
        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_plan(self, plan):
        self.remove_plan(plan['title'])

        query = ("insert into plans(title, duration, price, created_at, updated_at) "
            "values('{}','{}','{}', NOW(), NOW());".format(plan['title'], plan['duration'], plan['price']))
        info(query)

        conn = self.connect()
        
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()