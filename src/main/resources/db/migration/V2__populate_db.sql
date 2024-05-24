INSERT INTO worker (NAME, BIRTHDAY, LEVEL, SALARY) VALUES
                                                       ('John Doe', '1990-05-15', 'Trainee', 800),
                                                       ('Jane Smith', '1985-08-20', 'Junior', 1200),
                                                       ('Michael Johnson', '1980-11-10', 'Middle', 3000),
                                                       ('Emily Brown', '1975-03-25', 'Senior', 6000),
                                                       ('David Wilson', '1995-02-28', 'Trainee', 900),
                                                       ('Sarah Martinez', '1992-07-12', 'Junior', 1100),
                                                       ('Christopher Anderson', '1988-09-05', 'Middle', 3200),
                                                       ('Jessica Taylor', '1983-12-18', 'Senior', 6500),
                                                       ('Daniel Thomas', '1993-04-30', 'Trainee', 950),
                                                       ('Jennifer Garcia', '1986-06-22', 'Junior', 1300);

INSERT INTO client (NAME) VALUES
                              ('Client A'),
                              ('Client B'),
                              ('Client C'),
                              ('Client D'),
                              ('Client E');

INSERT INTO project (CLIENT_ID, START_DATE, FINISH_DATE) VALUES
                                                             (1, '2023-01-01', '2023-06-30'),
                                                             (2, '2023-02-01', '2023-08-31'),
                                                             (3, '2023-03-01', '2023-10-31'),
                                                             (4, '2023-04-01', '2024-01-31'),
                                                             (5, '2023-05-01', '2024-02-28'),
                                                             (1, '2023-06-01', '2023-11-30'),
                                                             (2, '2023-07-01', '2024-03-31'),
                                                             (3, '2023-08-01', '2024-04-30'),
                                                             (4, '2023-09-01', '2024-05-31'),
                                                             (5, '2023-10-01', '2024-06-30');

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (1, 1), (1, 2), (1, 3), (1, 4);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (2, 2), (2, 3), (2, 4), (2, 5);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (3, 1), (3, 3), (3, 4), (3, 5);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (4, 1), (4, 2), (4, 4), (4, 5);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (5, 2), (5, 3), (5, 4), (5, 5);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (6, 1), (6, 2), (6, 3), (6, 4);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (7, 2), (7, 3), (7, 4);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (8, 1), (8, 2), (8, 4);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (9, 3), (9, 4), (9, 5);

INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (10, 1), (10, 2), (10, 3), (10, 5);
