INSERT INTO course (name, img_Uri, img_Gray_Uri) VALUES ('Bootcamp HTML', 'https://cdn.pixabay.com/photo/2018/03/22/10/55/training-
course-3250007_1280.jpg', 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Switch-course-book-grey.svg');

INSERT INTO offer (edition, start_Moment, end_Moment, course_id) VALUES ('1.0', TIMESTAMP WITH TIME ZONE '2020-11-20T03:00:00Z', TIMESTAMP WITH
                                                                           TIME ZONE '2021-11-20T03:00:00Z', 1);
INSERT INTO offer (edition, start_Moment, end_Moment, course_id) VALUES ('2.0', TIMESTAMP WITH TIME ZONE '2020-12-20T03:00:00Z', TIMESTAMP WITH
                                                                         TIME ZONE '2021-12-20T03:00:00Z', 1);