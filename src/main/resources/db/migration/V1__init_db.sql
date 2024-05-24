CREATE TABLE IF NOT EXISTS worker (
                                      id serial PRIMARY KEY,
                                      name varchar NOT NULL CHECK(LENGTH(name) BETWEEN 2 AND 1000),
                                      birthday date CHECK(EXTRACT(YEAR FROM birthday) > 1900),
                                      level varchar NOT NULL CHECK(level IN ('Trainee', 'Junior', 'Middle', 'Senior')),
                                      salary int CHECK(salary BETWEEN 100 AND 100000)
);

CREATE TABLE IF NOT EXISTS client(
                                     id serial PRIMARY KEY,
                                     name varchar NOT NULL CHECK(LENGTH(name) BETWEEN 2 AND 1000)
);

CREATE TABLE IF NOT EXISTS project(
                                      id serial PRIMARY KEY,
                                      client_id int,
                                      start_date date,
                                      finish_date date,
                                      FOREIGN KEY(client_id) REFERENCES client(id)
);

CREATE TABLE IF NOT EXISTS project_worker(
                                             project_id int,
                                             worker_id int,
                                             PRIMARY KEY(project_id, worker_id),
                                             FOREIGN KEY(project_id) REFERENCES project(id),
                                             FOREIGN KEY(project_id) REFERENCES worker(id)
);